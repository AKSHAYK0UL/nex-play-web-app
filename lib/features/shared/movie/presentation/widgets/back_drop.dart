import 'package:flutter/material.dart';
import 'package:nex_play/core/widgets/image.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';

Widget buildBackdrop({required Movie movie}) {
  final path = movie.backdropPath ?? movie.posterPath;
  return Stack(
    fit: StackFit.expand,
    children: [
      path != null
          ? AppImage(path: path, size: 'original', fit: BoxFit.fill)
          : Container(color: const Color(0xFF1C1C1E)),

      DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.5, 1.0],
            colors: [
              Colors.black.withValues(alpha: 0.45),
              Colors.transparent,
              Colors.black,
            ],
          ),
        ),
      ),
    ],
  );
}
