import 'package:flutter/material.dart';

Widget buildRatingPill({required double rating}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Icon(Icons.star_rounded, color: Color(0xFFFFD60A), size: 15),
      const SizedBox(width: 3),
      Text(
        rating.toStringAsFixed(1),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
