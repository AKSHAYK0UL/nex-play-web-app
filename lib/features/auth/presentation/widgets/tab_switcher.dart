import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nex_play/core/theme/app_theme.dart';

Widget tabSwitcher(BuildContext context, TabController tabCtrl) {
  return AnimatedBuilder(
    animation: tabCtrl.animation!,
    builder: (_, __) {
      final t = tabCtrl.animation!.value;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          height: 48,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: Border.all(color: AppTheme.divider, width: 1),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 240),
                curve: Curves.easeInOutCubic,
                left: t >= 0.5
                    ? (MediaQuery.sizeOf(context).width - 48 - 8) / 2
                    : 0,

                top: 0,
                bottom: 0,
                width: (MediaQuery.sizeOf(context).width - 48 - 8) / 2,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppTheme.redBright, AppTheme.red],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.red.withValues(alpha: 0.35),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),

              // Tab labels
              Row(
                children: [
                  _tabLabel('Sign In', 0, t, tabCtrl),
                  _tabLabel('Sign Up', 1, t, tabCtrl),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _tabLabel(
  String label,
  int index,
  double animValue,
  TabController tabCtrl,
) {
  final active = animValue.round() == index;
  return Expanded(
    child: GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        tabCtrl.animateTo(index);
      },
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 220),
          style: TextStyle(
            color: active ? Colors.white : AppTheme.textDim,
            fontSize: 14,
            fontWeight: active ? FontWeight.w700 : FontWeight.w500,
            letterSpacing: 0.3,
          ),
          child: Text(label),
        ),
      ),
    ),
  );
}
