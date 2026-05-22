import 'package:flutter/widgets.dart';
import 'package:nex_play/core/theme/app_theme.dart';

Widget authLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          const Text(
            'NEX PLAY',
            style: TextStyle(
              color: AppTheme.red,
              fontSize: 15,
              fontWeight: FontWeight.w900,
              letterSpacing: 6,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your world of stories',
            style: TextStyle(
              color: AppTheme.textDim.withValues(alpha:0.8),
              fontSize: 13,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }