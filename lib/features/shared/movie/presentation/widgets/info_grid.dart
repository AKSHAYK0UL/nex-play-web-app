import 'package:flutter/material.dart';
import 'package:nex_play/core/helper/formater/formate_count.dart';
import 'package:nex_play/core/helper/formater/formate_data.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';


  Widget buildInfoGrid({required BuildContext context,required Movie movie}) {
    final items = <MapEntry<String, String>>[
      if ((movie.releaseDate ?? '').isNotEmpty)
        MapEntry('Release date', formatDate(movie.releaseDate!)),
      if ((movie.status ?? '').isNotEmpty) MapEntry('Status', movie.status!),
      if ((movie.originalLanguage ?? '').isNotEmpty)
        MapEntry('Language', movie.originalLanguage!.toUpperCase()),
      if (movie.voteCount != null && movie.voteCount! > 0)
        MapEntry('Ratings', formatCount(movie.voteCount!)),
    ];

    if (items.isEmpty) return const SizedBox.shrink();

    final columnWidth = (MediaQuery.of(context).size.width - 40 - 28) / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Info',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.85),
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 28,
          runSpacing: 18,
          children: items.map((e) {
            return SizedBox(
              width: columnWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.key,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.4),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    e.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
