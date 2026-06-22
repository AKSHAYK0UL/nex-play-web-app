
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';

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

  static const _allowedHosts = [
    'vidsrc.icu',
    'vidsrc.me',
    'vidsrc.net',
    'streamimdb.ru',
    'streamimdb.net',
    'streamimdb.me',
    'streamimdb.icu',
    'streamimdb',
    'vidsrcme.su',
    'vidsrc-embed.ru',
    'vsembed.ru',
  ];

  final _webViewSettings = InAppWebViewSettings(
    javaScriptEnabled: true,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    transparentBackground: true,
    useShouldOverrideUrlLoading: true,
    disableContextMenu: true,
    supportMultipleWindows: false,
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
    return _allowedHosts.any(
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

  // JS that hides player UI elements and monitors video state
  String get _injectScript => """
  (function() {
    if (window.__vsInjected) return;
    window.__vsInjected = true;

    // 1) Inject CSS rules
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
      // Hide fullscreen buttons
      '.fullscreen-btn, .fullscreen-button, .vjs-fullscreen-control,',
      '.fp-fullscreen, .mejs-fullscreen-button, .jw-icon-fullscreen,',
      '.pumpy-fullscreen, .vjs-button-fullscreen, .plyr__control--fullscreen,',
      '[class*="fullscreen" i], [class*="Fullsreen" i], [class*="full_screen" i],',
      '[data-fullscreen], button[title*="fullscreen" i], button[aria-label*="fullscreen" i]',
      '{ display: none !important; visibility: hidden !important; opacity: 0 !important; pointer-events: none !important; }',
      // Hide vidsrc branding containers
      '[class*="vidsrc" i], [id*="vidsrc" i], .vidsrc-logo, .vidsrc-text,',
      '.branding, .logo-text, [class*="logo" i][class*="src" i]'
    ].join('\\n');
    (document.head || document.documentElement).appendChild(style);

    // 2) Hide any small element whose text contains 'vidsrc'
    function hideVidsrcText() {
      try {
        var nodes = document.querySelectorAll('a, span, div, p, button, li, em, strong, small');
        nodes.forEach(function(el) {
          var t = (el.textContent || '').trim().toLowerCase();
          if (!t) return;
          if (t.indexOf('vidsrc') !== -1 || t === 'vid src' || t === 'vid-src') {
            var r = el.getBoundingClientRect();
            if (r.width <= 220 && r.height <= 70) {
              el.style.setProperty('display', 'none', 'important');
            }
          }
        });
      } catch (e) {}
    }

    // 3) Hide fullscreen buttons by attribute/class scan
    function hideFullscreenBtns() {
      try {
        document.querySelectorAll('button, a, div, span, svg').forEach(function(el) {
          var cls = ((el.className && el.className.toString) ? el.className.toString() : '').toLowerCase();
          var title = (el.getAttribute && el.getAttribute('title') || '').toLowerCase();
          var aria = (el.getAttribute && el.getAttribute('aria-label') || '').toLowerCase();
          if (cls.indexOf('fullscreen') !== -1 ||
              title.indexOf('fullscreen') !== -1 ||
              aria.indexOf('fullscreen') !== -1) {
            el.style.setProperty('display', 'none', 'important');
          }
        });
      } catch (e) {}
    }

    function runAll() {
      hideVidsrcText();
      hideFullscreenBtns();
    }

    runAll();

    // 4) Keep removing elements as they get added/re-rendered by the player
    var observer = new MutationObserver(function() {
      runAll();
    });
    var start = function() {
      if (document.body) {
        observer.observe(document.body, { childList: true, subtree: true });
      } else {
        setTimeout(start, 50);
      }
    };
    start();

    // 5) Prevent JS-triggered native fullscreen
    document.addEventListener('webkitfullscreenchange', function(e) {
      if (document.webkitFullscreenElement) {
        document.webkitExitFullscreen && document.webkitExitFullscreen();
      }
    }, true);
    document.addEventListener('fullscreenchange', function(e) {
      if (document.fullscreenElement) {
        document.exitFullscreen && document.exitFullscreen();
      }
    }, true);

    // 6) Stub out fullscreen request methods
    try {
      Element.prototype.requestFullscreen = function() {};
      Element.prototype.webkitRequestFullscreen = function() {};
      HTMLVideoElement.prototype.webkitEnterFullscreen = function() {};
    } catch (e) {}

    // 7) Detect video play/pause state and notify Flutter
    // We send the state EVERY SECOND to keep the Flutter watchdog alive.
    var videoStateTimer = setInterval(function() {
      var isPaused = true;
      var foundVideo = false;
      try {
        var v = document.querySelector('video');
        if (v) {
          foundVideo = true;
          isPaused = v.paused;
        } else {
          var iframes = document.querySelectorAll('iframe');
          for (var i = 0; i < iframes.length; i++) {
            try {
              var iv = iframes[i].contentWindow.document.querySelector('video');
              if (iv) {
                foundVideo = true;
                isPaused = iv.paused;
                break;
              }
            } catch (e) {} // CORS blocked
          }
        }
      } catch (e) {}
      
      if (foundVideo) {
        var newState = isPaused ? 'paused' : 'playing';
        if (window.flutter_inappwebview) {
          window.flutter_inappwebview.callHandler('onVideoState', newState);
        }
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
                  
                  // Listen to video state from JS
                  controller.addJavaScriptHandler(
                    handlerName: 'onVideoState',
                    callback: (args) {
                      if (args.isNotEmpty) {
                        _canDetectState = true;
                        _stateWatchdog?.cancel();
                        // If no update in 4s, assume we lost detection
                        _stateWatchdog = Timer(const Duration(seconds: 4), () {
                          if (mounted) setState(() => _canDetectState = false);
                        });
                        
                        final state = args[0] as String;
                        final isPlaying = state == 'playing';
                        
                        // Only rebuild UI if state changed, OR if paused but controls are hidden
                        if (_isVideoPlaying != isPlaying || (!isPlaying && !_isControlVisible)) {
                          if (mounted) {
                            setState(() {
                              _isVideoPlaying = isPlaying;
                              if (_isVideoPlaying) {
                                // If video starts playing, hide the controls
                                _hideTimer?.cancel();
                                _isControlVisible = false;
                              } else {
                                // If video is paused, show controls constantly
                                _hideTimer?.cancel();
                                _isControlVisible = true;
                              }
                            });
                          }
                        }
                      }
                    },
                  );
                },

                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  final url = navigationAction.request.url?.toString();
                  if (!_isHostAllowed(url)) {
                    debugPrint('🚫 Blocked: $url');
                    return NavigationActionPolicy.CANCEL;
                  }
                  return NavigationActionPolicy.ALLOW;
                },

                onLoadStart: (controller, url) {
                  controller.evaluateJavascript(source: _injectScript);
                },

                onLoadStop: (controller, url) {
                  controller.evaluateJavascript(source: _injectScript);
                },

                // Block WebView native fullscreen takeover
                onEnterFullscreen: (controller) async {
                  await controller.evaluateJavascript(
                    source: "if (document.fullscreenElement) { document.exitFullscreen(); } "
                            "if (document.webkitFullscreenElement) { document.webkitExitFullscreen(); }",
                  );
                },

                onReceivedError: (controller, request, error) {
                  if (request.isForMainFrame == true && mounted) {
                    setState(() => _hasError = true);
                  }
                },
              ),
            ),

          
          // This detects screen taps to toggle the UI, but because it's 
          // "translucent", it lets the touches pass through to the WebView.
          if (!_hasError)
            Positioned.fill(
              child: Listener(
                behavior: HitTestBehavior.translucent,
                onPointerDown: (_) => _handleScreenTap(),
              ),
            ),

          //  Back Button Overlay 
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

          //  Error state 
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