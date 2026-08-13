import 'dart:async';
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

final Map<String, Timer> _watchdogs = {};
final Map<String, StreamSubscription<html.Event>> _loadSubscriptions = {};

void registerGuardedIframe({
  required String viewType,
  required String url,
  required void Function(String message) onRedirectBlocked,
}) {
  ui_web.platformViewRegistry.registerViewFactory(viewType, (int _) {
    final iframe = html.IFrameElement()
      ..src = url
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%'
      ..setAttribute(
        'sandbox',
        'allow-scripts allow-same-origin allow-forms allow-presentation allow-encrypted-media',
      )
      ..setAttribute(
        'allow',
        'autoplay; encrypted-media; picture-in-picture; fullscreen',
      )
      ..setAttribute('referrerpolicy', 'no-referrer')
      ..setAttribute('scrolling', 'no')
      ..allowFullscreen = true;

    var settled = false;

    _loadSubscriptions[viewType] = iframe.onLoad.listen((_) {
      if (!settled) {
        _watchdogs[viewType]?.cancel();
        _watchdogs[viewType] = Timer(const Duration(milliseconds: 2500), () {
          settled = true;
        });
        return;
      }

      settled = false;
      onRedirectBlocked('Blocked a redirect attempt and restored the player.');

      iframe.src = 'about:blank';
      Timer(const Duration(milliseconds: 50), () {
        iframe.src = url;
      });
    });

    return iframe;
  });
}

void disposeGuardedIframe(String viewType) {
  _watchdogs.remove(viewType)?.cancel();
  _loadSubscriptions.remove(viewType)?.cancel();
}
