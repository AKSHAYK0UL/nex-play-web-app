void registerGuardedIframe({
  required String viewType,
  required String url,
  required void Function(String message) onRedirectBlocked,
}) {
  // No-op on mobile/desktop.
}

void disposeGuardedIframe(String viewType) {
  // No-op on mobile/desktop.
}
