import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final bool pressed;
  final VoidCallback onTap;

  const ContinueButton({super.key, required this.pressed, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: pressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 130),
        curve: Curves.easeInOut,
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.red.withValues(alpha: 0.495),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.18),
                blurRadius: 32,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Continue',
                style: TextStyle(
                  fontFamily: '.SF Pro Display',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(width: 6),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
                size: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
