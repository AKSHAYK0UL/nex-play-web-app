import 'package:flutter/material.dart';
import 'package:nex_play/core/theme/app_theme.dart';

Widget iconMark(IconData iconData) {
  return Container(
    width: 58,
    height: 58,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppTheme.redBright, AppTheme.redDeep],
      ),
      boxShadow: [
        BoxShadow(
          color: AppTheme.red.withValues(alpha: 0.4),
          blurRadius: 20,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Center(child: Icon(iconData, color: Colors.white, size: 26)),
  );
}
