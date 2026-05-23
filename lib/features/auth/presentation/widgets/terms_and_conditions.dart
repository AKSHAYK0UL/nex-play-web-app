import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nex_play/core/theme/app_theme.dart';


// ignore: must_be_immutable
class TermsAndConditions extends StatefulWidget {
  bool agreedToTerms;
  final ValueChanged<bool>? onChanged;

  TermsAndConditions({super.key, required this.agreedToTerms, this.onChanged});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        setState(() => widget.agreedToTerms = !widget.agreedToTerms);
        widget.onChanged?.call(widget.agreedToTerms);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: widget.agreedToTerms ? AppTheme.red : Colors.transparent,
              border: Border.all(
                color: widget.agreedToTerms ? AppTheme.red : AppTheme.textDim,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: widget.agreedToTerms
                ? const Icon(Icons.check_rounded, color: Colors.white, size: 14)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: AppTheme.textSub,
                  fontSize: 13,
                  height: 1.4,
                ),
                children: [
                  TextSpan(text: 'I agree to the '),
                  TextSpan(
                    text: 'Terms of Service',
                    style: TextStyle(
                      color: AppTheme.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: AppTheme.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
