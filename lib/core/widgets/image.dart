import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nex_play/core/config/secrets.dart';


class AppImage extends StatelessWidget {
  static const _imageBase = imageBaseURL;

  final String path;

  /// Options: w92 · w154 · w185 · w342 · w500 · w780 · original
  final String size;

  final double? width;
  final double? height;
  final BoxFit fit;

  const AppImage({
    super.key,
    required this.path,
    this.size = 'w500',
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  String get _url => '$_imageBase$size$path';

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: _url,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => _Placeholder(width: width, height: height),
      errorWidget: (context, url, _) => _ErrorPlaceholder(width: width, height: height),
    );
  }
}

//  Internal  widgets 

class _Placeholder extends StatelessWidget {
  final double? width;
  final double? height;
  const _Placeholder({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return _shell(
      width: width,
      height: height,
      child: const CircularProgressIndicator(
        strokeWidth: 2,
        color: Colors.white54,
      ),
    );
  }
}

class _ErrorPlaceholder extends StatelessWidget {
  final double? width;
  final double? height;
  const _ErrorPlaceholder({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return _shell(
      width: width,
      height: height,
      child: const Icon(
        Icons.broken_image_outlined,
        color: Colors.white30,
        size: 36,
      ),
    );
  }
}

Widget _shell({
  required double? width,
  required double? height,
  required Widget child,
}) {
  return Container(
    width: width,
    // Only constrains height when explicitly provided
    height: height,
    color: const Color(0xFF1C1C1E),
    child: Center(child: child),
  );
}