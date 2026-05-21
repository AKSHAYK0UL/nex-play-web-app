import 'dart:ui';

import 'package:flutter/material.dart';

class LogoBadge extends StatelessWidget {
  const LogoBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 02, sigmaY: 02),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.18),
              width: 0.6,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.play_circle_fill_rounded,
                color: Colors.red.withValues(alpha: 0.51),
                size: 18,
              ),
              SizedBox(width: 7),
              Text(
                'NEX PLAY',
                style: TextStyle(
                  fontFamily: '.SF Pro Display',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.61),
                  letterSpacing: 2.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
