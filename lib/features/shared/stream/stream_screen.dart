import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_play/core/config/secrets.dart';

class StreamScreen extends StatefulWidget {
  final String streamUrl;

  const StreamScreen({super.key, required this.streamUrl});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  InAppWebViewController? _controller;
  bool _hasError = false;

  // Back button visibility state
  bool _isControlVisible = false;
  Timer? _hideTimer;

  // Video state tracking
  bool _isVideoPlaying = false;
  bool _canDetectState = false;
  Timer? _stateWatchdog;

  final _webViewSettings = InAppWebViewSettings(
    javaScriptEnabled: true,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    transparentBackground: true,
    useShouldOverrideUrlLoading: true,
    disableContextMenu: true,
    // Must be true so onCreateWindow fires and we can block iframe popups.
    supportMultipleWindows: true,
  );

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _stateWatchdog?.cancel();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  Future<void> _reload() async {
    setState(() => _hasError = false);
    await _controller?.loadUrl(
      urlRequest: URLRequest(url: WebUri(widget.streamUrl)),
    );
  }

  bool _isHostAllowed(String? url) {
    if (url == null) return false;
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
    // kAllowedHosts comes from lib/core/config/secrets.dart (gitignored)
    return kAllowedHosts.any(
      (host) => uri.host == host || uri.host.endsWith('.$host'),
    );
  }

  void _handleScreenTap() {
    if (_canDetectState && !_isVideoPlaying) {
      _hideTimer?.cancel();
      setState(() => _isControlVisible = true);
      return;
    }

    _hideTimer?.cancel();
    setState(() {
      _isControlVisible = !_isControlVisible;
    });

    if (_isControlVisible) {
      _hideTimer = Timer(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() => _isControlVisible = false);
        }
      });
    }
  }

  // Builds the JS allowed-hosts array from kAllowedHosts at runtime,
  // so the list is never duplicated anywhere in the source.
  String get _allowedHostsJs =>
      '[${kAllowedHosts.map((h) => "'$h'").join(', ')}]';

  String get _injectScript => """
  (function() {
    if (window.__vsInjected) return;
    window.__vsInjected = true;

    //  1) Base CSS 
    var style = document.createElement('style');
    style.textContent = [
      '* {',
      '  -webkit-tap-highlight-color: transparent !important;',
      '  -webkit-touch-callout: none !important;',
      '  -webkit-user-select: none !important;',
      '  user-select: none !important;',
      '  outline: none !important;',
      '}',
      'body { background: #000 !important; }',
      '.fullscreen-btn, .fullscreen-button, .vjs-fullscreen-control,',
      '.fp-fullscreen, .mejs-fullscreen-button, .jw-icon-fullscreen,',
      '.pumpy-fullscreen, .vjs-button-fullscreen, .plyr__control--fullscreen,',
      '[class*="fullscreen" i], [class*="Fullsreen" i], [class*="full_screen" i],',
      '[data-fullscreen], button[title*="fullscreen" i], button[aria-label*="fullscreen" i]',
      '{ display: none !important; visibility: hidden !important; opacity: 0 !important; pointer-events: none !important; }'
    ].join('\\n');
    (document.head || document.documentElement).appendChild(style);

    //  2) Hide fullscreen buttons by attribute/class scan 
    function hideFullscreenBtns() {
      try {
        document.querySelectorAll('button, a, div, span, svg').forEach(function(el) {
          var cls   = ((el.className && el.className.toString) ? el.className.toString() : '').toLowerCase();
          var title = (el.getAttribute && el.getAttribute('title') || '').toLowerCase();
          var aria  = (el.getAttribute && el.getAttribute('aria-label') || '').toLowerCase();
          if (cls.indexOf('fullscreen')   !== -1 ||
              title.indexOf('fullscreen') !== -1 ||
              aria.indexOf('fullscreen')  !== -1) {
            el.style.setProperty('display', 'none', 'important');
          }
        });
      } catch (e) {}
    }

    // 3) Best-effort: patch same-origin iframes' window.open 
    // Cross-origin iframes throw CORS errors here — those are handled by the
    // Flutter onCreateWindow callback below.
    function patchIframeOpen() {
      try {
        document.querySelectorAll('iframe').forEach(function(f) {
          try {
            if (f.contentWindow) f.contentWindow.open = function() { return null; };
          } catch (e) {}
        });
      } catch (e) {}
    }

    function runAll() {
      hideFullscreenBtns();
      patchIframeOpen();
    }

    runAll();

    //  4) Watch for dynamically added/re-rendered elements 
    var observer = new MutationObserver(function() { runAll(); });
    var start = function() {
      if (document.body) {
        observer.observe(document.body, { childList: true, subtree: true });
      } else {
        setTimeout(start, 50);
      }
    };
    start();

    // 5) Prevent JS-triggered native fullscreen 
    document.addEventListener('webkitfullscreenchange', function() {
      if (document.webkitFullscreenElement) {
        document.webkitExitFullscreen && document.webkitExitFullscreen();
      }
    }, true);
    document.addEventListener('fullscreenchange', function() {
      if (document.fullscreenElement) {
        document.exitFullscreen && document.exitFullscreen();
      }
    }, true);

    //  6) Stub out fullscreen request methods 
    try {
      Element.prototype.requestFullscreen              = function() {};
      Element.prototype.webkitRequestFullscreen        = function() {};
      HTMLVideoElement.prototype.webkitEnterFullscreen = function() {};
    } catch (e) {}

    //  7) Block window.open  primary ad popup method used in iframes 
    try { window.open = function() { return null; }; } catch (e) {}

    //  8) Intercept anchor clicks/taps to block ad-host navigation 
    // ALLOWED is injected at runtime from kAllowedHosts in secrets.dart,
    // so the host list is never duplicated anywhere in the codebase.
    (function() {
      var ALLOWED = $_allowedHostsJs;
      function isAllowed(url) {
        try {
          var h = new URL(url).hostname;
          return ALLOWED.some(function(a) { return h === a || h.endsWith('.' + a); });
        } catch (e) {
          return true; // Relative / unparseable URLs → allow
        }
      }
      function blockAdLink(e) {
        var el = e.target;
        while (el && el !== document.documentElement) {
          if (el.tagName === 'A' && el.href) {
            if (!isAllowed(el.href)) {
              e.preventDefault();
              e.stopPropagation();
            }
            return;
          }
          el = el.parentElement;
        }
      }
      // Capture phase fires before the player's own handlers
      document.addEventListener('click',    blockAdLink, true);
      document.addEventListener('touchend', blockAdLink, true);
    })();

    //  9) Video play/pause state → Flutter 
    setInterval(function() {
      var isPaused   = true;
      var foundVideo = false;
      try {
        var v = document.querySelector('video');
        if (v) {
          foundVideo = true;
          isPaused   = v.paused;
        } else {
          var iframes = document.querySelectorAll('iframe');
          for (var i = 0; i < iframes.length; i++) {
            try {
              var iv = iframes[i].contentWindow.document.querySelector('video');
              if (iv) { foundVideo = true; isPaused = iv.paused; break; }
            } catch (e) {}
          }
        }
      } catch (e) {}

      if (foundVideo && window.flutter_inappwebview) {
        window.flutter_inappwebview.callHandler(
          'onVideoState', isPaused ? 'paused' : 'playing'
        );
      }
    }, 1000);
  })();
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          if (!_hasError)
            Positioned.fill(
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: WebUri(widget.streamUrl)),
                initialSettings: _webViewSettings,

                onWebViewCreated: (controller) {
                  _controller = controller;

                  controller.addJavaScriptHandler(
                    handlerName: 'onVideoState',
                    callback: (args) {
                      if (args.isEmpty) return;

                      _canDetectState = true;
                      _stateWatchdog?.cancel();
                      _stateWatchdog = Timer(const Duration(seconds: 4), () {
                        if (mounted) setState(() => _canDetectState = false);
                      });

                      final isPlaying = (args[0] as String) == 'playing';

                      if (_isVideoPlaying != isPlaying ||
                          (!isPlaying && !_isControlVisible)) {
                        if (mounted) {
                          setState(() {
                            _isVideoPlaying = isPlaying;
                            _hideTimer?.cancel();
                            if (_isVideoPlaying) {
                              _isControlVisible = false;
                            } else {
                              _isControlVisible = true;
                            }
                          });
                        }
                      }
                    },
                  );
                },

                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  final url = navigationAction.request.url?.toString();
                  if (!_isHostAllowed(url)) {
                    return NavigationActionPolicy.CANCEL;
                  }
                  return NavigationActionPolicy.ALLOW;
                },

                // Blocks ALL popup/new-window creation from iframes.
                // Flutter-side guard for cross-origin iframes that call
                // window.open()  requires supportMultipleWindows: true.
                onCreateWindow: (controller, createWindowAction) async {
                  return false;
                },

                onLoadStart: (controller, url) {
                  controller.evaluateJavascript(source: _injectScript);
                },

                onLoadStop: (controller, url) {
                  controller.evaluateJavascript(source: _injectScript);
                },

                onEnterFullscreen: (controller) async {
                  await controller.evaluateJavascript(
                    source:
                        "if (document.fullscreenElement) document.exitFullscreen();"
                        "if (document.webkitFullscreenElement) document.webkitExitFullscreen();",
                  );
                },

                onReceivedError: (controller, request, error) {
                  if (request.isForMainFrame == true && mounted) {
                    setState(() => _hasError = true);
                  }
                },
              ),
            ),

          // Translucent tap detector  passes touches through to the WebView.
          if (!_hasError)
            Positioned.fill(
              child: Listener(
                behavior: HitTestBehavior.translucent,
                onPointerDown: (_) => _handleScreenTap(),
              ),
            ),

          // Back button overlay
          if (!_hasError)
            Positioned(
              top: 20,
              left: -20,
              child: SafeArea(
                child: IgnorePointer(
                  ignoring: !_isControlVisible,
                  child: AnimatedOpacity(
                    opacity: _isControlVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 750),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, top: 6),
                      child: _GlassIconButton(
                        icon: Icons.arrow_back_ios_new_rounded,
                        onTap: () => context.pop(),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          // Error state
          if (_hasError)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 52),
                  const SizedBox(height: 12),
                  const Text(
                    'Failed to load video',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _reload,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white12,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _GlassIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Material(
          color: Colors.white.withOpacity(0.14),
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: Icon(icon, color: Colors.white, size: 18),
            ),
          ),
        ),
      ),
    );
  }
}