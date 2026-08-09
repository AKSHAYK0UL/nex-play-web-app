import 'package:flutter/material.dart';
import 'package:nex_play/core/helper/formater/formate_runtime.dart';
import 'package:nex_play/core/helper/formater/formate_year.dart';
import 'package:nex_play/core/widgets/image.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';
import 'package:nex_play/features/shared/movie/presentation/widgets/meta_text.dart';
import 'package:nex_play/features/shared/movie/presentation/widgets/rating_pill.dart';

Widget buildTitleRow({required Movie movie}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 92,
        height: 138,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: movie.posterPath != null
              ? AppImage(
                  path: movie.posterPath!,
                  size: 'w342',
                  fit: BoxFit.fill,
                )
              : Container(color: const Color(0xFF1C1C1E)),
        ),
      ),

      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.4,
                height: 1.15,
              ),
            ),
            if ((movie.tagline ?? '').isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                movie.tagline!,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
            const SizedBox(height: 10),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              runSpacing: 6,
              children: [
                if (movie.voteAverage != null && movie.voteAverage! > 0)
                  buildRatingPill(rating: movie.voteAverage!),
                if (formateYear(movie.releaseDate) != null)
                  buildMetaText(text: formateYear(movie.releaseDate)!),
                if (movie.runtime != null && movie.runtime! > 0)
                  buildMetaText(text: formatRuntime(movie.runtime!)),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
