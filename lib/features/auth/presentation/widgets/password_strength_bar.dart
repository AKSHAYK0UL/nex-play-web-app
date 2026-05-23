import 'package:flutter/material.dart';
import 'package:nex_play/core/theme/app_theme.dart';
import 'package:nex_play/core/utils/validators.dart';

class PasswordStrengthBar extends StatelessWidget {
  final String password;
  const PasswordStrengthBar({super.key, required this.password});

  String get _label => [
    '',
    'Weak',
    'Fair',
    'Good',
    'Strong',
  ][Validators.passwordStrength(password)];

  Color get _color => [
    Colors.transparent,
    const Color(0xFFFF4444),
    const Color(0xFFFFAA00),
    const Color(0xFF44AAFF),
    const Color(0xFF22CC88),
  ][Validators.passwordStrength(password)];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(4, (i) {
              return Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  margin: EdgeInsets.only(right: i < 3 ? 4 : 0),
                  height: 3,
                  decoration: BoxDecoration(
                    color: i < Validators.passwordStrength(password)
                        ? _color
                        : AppTheme.divider,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            }),
          ),
          if (Validators.passwordStrength(password) > 0)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  color: _color,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
                child: Text(_label),
              ),
            ),
        ],
      ),
    );
  }
}
