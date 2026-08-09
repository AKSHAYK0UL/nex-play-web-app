import 'package:flutter/material.dart';
import 'package:nex_play/features/shared/movie/domain/entities/genre.dart';

Widget buildGenreChip({required List<Genre> genres}) {
  return Wrap(
    spacing: 8,
    runSpacing: 8,
    children: genres.take(4).map((g) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
        ),

        child: Text(
          g.name,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.75),
            fontSize: 12.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }).toList(),
  );
}
