import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_play/core/theme/app_theme.dart';

Widget backButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
    child: Row(children: [GestureDetector(
      onTap:()=> context.pop(),
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.divider),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppTheme.text,
          size: 16,
        ),
      ),
    ),const Spacer()]),
  );
}
