
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_play/core/router/app_router.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';
import 'package:nex_play/features/shared/movie/presentation/widgets/circle_action.dart';

Widget buildActionRow({
  required BuildContext context,
  required Color accent,
  required Movie movie,
  required bool isLoading,
}) {
  final canPlay = !isLoading && (movie.streamUrl ?? '').isNotEmpty;
  return Row(
    children: [
      Expanded(
        child: Material(
          color: canPlay ? accent : accent.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: canPlay
                ? () => context.pushNamed(
                    RouteName.streamScreen,
                    extra: movie.streamUrl,
                  )
                : null,
            splashColor: Colors.white.withValues(alpha: 0.15),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow_rounded, color: Colors.white, size: 22),
                  SizedBox(width: 6),
                  Text(
                    'Play',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: 10),
      buildCircleAction(icon: Icons.add_rounded, onTap: () {}),
      const SizedBox(width: 10),
      buildCircleAction(icon: Icons.favorite_border, onTap: () {}),
    ],
  );
}
