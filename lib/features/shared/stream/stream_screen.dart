

//##########################################################################
import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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

  // Key to force-rebuild the Web Iframe on demand or recovery
  Key _webPlayerKey = UniqueKey();

  // Error handling state
  bool _hasError = false;
  String _errorMessage = '';

  // Control bar visibility state
  bool _isControlVisible = false;
  Timer? _hideTimer;

  // Video state tracking (Mobile)
  bool _isVideoPlaying = false;
  bool _canDetectState = false;
  Timer? _stateWatchdog;

  // Web ad-block state
  int _webAdClickCount = 0;
  static const int _requiredShieldClicks = 3;

  // Mobile WebView Settings
  final _webViewSettings = InAppWebViewSettings(
    javaScriptEnabled: true,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    transparentBackground: true,
    useShouldOverrideUrlLoading: true,
    disableContextMenu: true,
    supportMultipleWindows: false,
    javaScriptCanOpenWindowsAutomatically: false, // Strictly block popups
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

  bool _isHostAllowed(String? url) {
    if (url == null) return false;
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
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

  void _resetWebStream() {
    setState(() {
      _hasError = false;
      _errorMessage = '';
      _webAdClickCount = 0;
      _webPlayerKey = UniqueKey(); // Re-instantiates iframe cleanly
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Stream reloaded and protected.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  String get _allowedHostsJs =>
      '[${kAllowedHosts.map((h) => "'$h'").join(', ')}]';

  String get _injectScript => """
  (function() {
    if (window.__vsInjected) return;
    window.__vsInjected = true;

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

    var observer = new MutationObserver(function() { runAll(); });
    var start = function() {
      if (document.body) {
        observer.observe(document.body, { childList: true, subtree: true });
      } else {
        setTimeout(start, 50);
      }
    };
    start();

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

    try {
      Element.prototype.requestFullscreen              = function() {};
      Element.prototype.webkitRequestFullscreen        = function() {};
      HTMLVideoElement.prototype.webkitEnterFullscreen = function() {};
    } catch (e) {}

    try { 
      window.open = function() { return null; }; 
      if (window.parent) window.parent.open = function() { return null; };
      if (window.top) window.top.open = function() { return null; };
    } catch (e) {}

    (function() {
      var ALLOWED = $_allowedHostsJs;
      function isAllowed(url) {
        try {
          var h = new URL(url).hostname;
          return ALLOWED.some(function(a) { return h === a || h.endsWith('.' + a); });
        } catch (e) {
          return false; 
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
      document.addEventListener('click',    blockAdLink, true);
      document.addEventListener('touchend', blockAdLink, true);
    })();

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

  Widget _buildWebPlayer() {
    return Stack(
      key: _webPlayerKey,
      children: [
        Positioned.fill(
          child: HtmlWidget(
            '''
            <style>
              html, body {
                margin: 0 !important;
                padding: 0 !important;
                width: 100% !important;
                height: 100% !important;
                overflow: hidden !important;
                background: #000 !important;
              }
              iframe {
                position: fixed !important;
                top: 0 !important;
                left: 0 !important;
                width: 100vw !important;
                height: 100vh !important;
                border: none !important;
                margin: 0 !important;
                padding: 0 !important;
                display: block !important;
              }
            </style>
            
            <iframe
              src="${widget.streamUrl}"
              scrolling="no"
              allow="autoplay; encrypted-media; picture-in-picture; fullscreen"
              sandbox="allow-scripts allow-forms allow-presentation allow-encrypted-media"
              referrerpolicy="no-referrer"
              allowfullscreen="true">
            </iframe>
            ''',
            customStylesBuilder: (element) {
              if (element.localName == 'iframe') {
                return {
                  'position': 'fixed',
                  'top': '0',
                  'left': '0',
                  'width': '100vw',
                  'height': '100vh',
                  'border': 'none',
                  'margin': '0',
                  'padding': '0',
                  'display': 'block',
                };
              }
              return {
                'margin': '0',
                'padding': '0',
                'width': '100%',
                'height': '100%',
              };
            },
          ),
        ),

        // WEB AD SHIELD OVERLAY (Absorbs ad trigger taps)
        if (_webAdClickCount < _requiredShieldClicks)
          Positioned.fill(
            child: Listener(
              behavior: HitTestBehavior.opaque,
              onPointerDown: (_) {
                setState(() => _webAdClickCount++);
                final remaining = _requiredShieldClicks - _webAdClickCount;
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      remaining > 0
                          ? 'Ad Shield: Tapped $_webAdClickCount/$_requiredShieldClicks ($remaining more to unlock player)'
                          : 'Player unlocked! Tap play on the video.',
                    ),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.blueAccent,
                  ),
                );
              },
              child: Container(color: Colors.transparent),
            ),
          ),

      
      ],
    );
  }

  Widget _buildMobilePlayer() {
    return InAppWebView(
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

        if (url == null) return NavigationActionPolicy.CANCEL;

        // Block non-HTTP schemas (e.g., intent://, market://, whatsapp://)
        if (!url.startsWith('http://') && !url.startsWith('https://')) {
          return NavigationActionPolicy.CANCEL;
        }

        // Malicious domains blacklist
        final blockedKeywords = ['playin04.com', 'gohappyin.com', 'redtrackApi'];
        if (blockedKeywords.any((keyword) => url.contains(keyword))) {
          return NavigationActionPolicy.CANCEL;
        }

        // Whitelist enforcement
        if (!_isHostAllowed(url)) {
          return NavigationActionPolicy.CANCEL;
        }

        return NavigationActionPolicy.ALLOW;
      },
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
          setState(() {
            _hasError = true;
            _errorMessage = error.description.isNotEmpty
                ? error.description
                : 'Failed to load video stream.';
          });
        }
      },
      onReceivedHttpError: (controller, request, errorResponse) {
        if (request.isForMainFrame == true && mounted) {
          setState(() {
            _hasError = true;
            _errorMessage =
                'HTTP Error ${errorResponse.statusCode}: ${errorResponse.reasonPhrase ?? "Unable to reach video server"}';
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Active Player View (Web or Mobile)
          if (!_hasError)
            Positioned.fill(
              child: kIsWeb ? _buildWebPlayer() : _buildMobilePlayer(),
            ),

          // Tap gesture overlay for controls (Mobile only)
          if (!_hasError && !kIsWeb)
            Positioned.fill(
              child: Listener(
                behavior: HitTestBehavior.translucent,
                onPointerDown: (_) => _handleScreenTap(),
              ),
            ),

          // Top Header Bar (Back Button)
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            child: SafeArea(
              child: IgnorePointer(
                ignoring: !_hasError && !kIsWeb && !_isControlVisible,
                child: AnimatedOpacity(
                  opacity:
                      (_hasError || kIsWeb || _isControlVisible) ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Visibility(
                    visible: !kIsWeb,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: _GlassIconButton(
                        icon: Icons.arrow_back_ios_new_rounded,
                        onTap: () => context.pop(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ERROR OVERLAY WITH RETRY ACTION
          if (_hasError)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 52),
                  const SizedBox(height: 12),
                  Text(
                    _errorMessage.isNotEmpty
                        ? _errorMessage
                        : 'Failed to load video',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (kIsWeb) {
                        _resetWebStream();
                      } else {
                        setState(() {
                          _hasError = false;
                          _errorMessage = '';
                        });
                        _controller?.reload();
                      }
                    },
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
          color: Colors.white.withValues(alpha: 0.14),
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(icon, color: Colors.white, size: 18),
            ),
          ),
        ),
      ),
    );
  }
}