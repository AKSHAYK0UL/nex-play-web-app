import 'package:flutter/widgets.dart';
import 'package:nex_play/core/theme/app_theme.dart';

Widget forgotPasswordHeader() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Forgot your\npassword?',
        style: TextStyle(
          color: AppTheme.text,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          height: 1.15,
          letterSpacing: 0.2,
        ),
      ),
      SizedBox(height: 12),
      Text(
        "No worries — it happens to everyone.\nEnter your email and we'll send a\nreset code right away.",
        style: TextStyle(color: AppTheme.textSub, fontSize: 15, height: 1.55),
      ),
    ],
  );
}
