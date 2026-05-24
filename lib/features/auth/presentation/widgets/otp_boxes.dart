import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nex_play/core/constants/api_const.dart';
import 'package:nex_play/core/theme/app_theme.dart';

Widget otpBoxes({
  required Animation<double> shakeAnim,
  required List<FocusNode> focusNodes,
  required List<TextEditingController> controllers,
  required bool hasError,
  required void Function(int index, String value) onDigitEntered,
  required void Function(int index) onBackspace,
}) {
  return AnimatedBuilder(
    animation: shakeAnim,
    builder: (_, child) {
      final shakeX = hasError && shakeAnim.value > 0
          ? (1 - shakeAnim.value) *
              10 *
              ((shakeAnim.value * 6).toInt().isEven ? 1 : -1)
          : 0.0;
      return Transform.translate(offset: Offset(shakeX, 0), child: child);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        ApiConst.otpCodeLenght,
        (i) => _OtpBox(
          controller: controllers[i],
          focusNode: focusNodes[i],
          hasError: hasError,
          onChanged: (v) => onDigitEntered(i, v),
          onBackspace: () => onBackspace(i),
        ),
      ),
    ),
  );
}

class _OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool hasError;
  final ValueChanged<String> onChanged;
  final VoidCallback onBackspace;

  const _OtpBox({
    required this.controller,
    required this.focusNode,
    required this.hasError,
    required this.onChanged,
    required this.onBackspace,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([focusNode, controller]),
      builder: (_, __) {
        final focused = focusNode.hasFocus;
        final filled = controller.text.isNotEmpty;

        return SizedBox(
          width: 48,
          height: 60,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              color: filled
                  ? AppTheme.red.withValues(alpha: 0.08)
                  : AppTheme.fieldBg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: hasError
                    ? const Color(0xFFFF4444)
                    : focused
                        ? AppTheme.red
                        : filled
                            ? AppTheme.red.withValues(alpha: 0.4)
                            : AppTheme.fieldBorder,
                width: (focused || hasError) ? 1.8 : 1.2,
              ),
              boxShadow: focused
                  ? [
                      BoxShadow(
                        color: AppTheme.red.withValues(alpha: 0.18),
                        blurRadius: 12,
                      ),
                    ]
                  : const [],
            ),
            child: Center(
              child: KeyboardListener(
                focusNode: FocusNode(),
                onKeyEvent: (event) {
                  if (event is KeyDownEvent &&
                      event.logicalKey == LogicalKeyboardKey.backspace) {
                    onBackspace();
                  }
                },
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  style: TextStyle(
                    color: filled ? AppTheme.text : AppTheme.textSub,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                    isCollapsed: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: onChanged,
                  onTap: () {
                    controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: controller.text.length),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
