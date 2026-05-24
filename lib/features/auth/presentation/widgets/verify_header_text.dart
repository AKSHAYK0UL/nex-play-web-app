import 'package:flutter/material.dart';
import 'package:nex_play/core/theme/app_theme.dart';

Widget verifyHeaderText(String email) {
  final atIdx = email.indexOf('@');
  final masked = atIdx > 2
      ? '${email.substring(0, 2)}***${email.substring(atIdx)}'
      : email;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Check your\ninbox.',
        style: TextStyle(
          color: AppTheme.text,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          height: 1.15,
          letterSpacing: 0.2,
        ),
      ),
      const SizedBox(height: 12),
      RichText(
        text: TextSpan(
          style: const TextStyle(
            color: AppTheme.textSub,
            fontSize: 15,
            height: 1.5,
          ),
          children: [
            const TextSpan(text: "We sent a 6-digit code to\n"),
            TextSpan(
              text: masked,
              style: const TextStyle(
                color: AppTheme.text,
                fontWeight: FontWeight.w600,
              ),
            ),
            const TextSpan(text: '. It expires in 10 minutes.'),
          ],
        ),
      ),
    ],
  );
}
