

import 'package:flutter/material.dart';
import 'package:nex_play/core/theme/app_theme.dart';

class AuthButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final bool loading;
  final bool secondary;

  const AuthButton({
    super.key,
    required this.label,
    this.onTap,
    this.loading = false,
    this.secondary = false,
  });

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleCtrl;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _scaleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnim = Tween<double>(
      begin: 1,
      end: 0.97,
    ).animate(CurvedAnimation(parent: _scaleCtrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _scaleCtrl.forward(),
      onTapUp: (_) {
        _scaleCtrl.reverse();
        if (!widget.loading) widget.onTap?.call();
      },
      onTapCancel: () => _scaleCtrl.reverse(),
      child: ScaleTransition(
        scale: _scaleAnim,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            gradient: widget.secondary
                ? null
                : const LinearGradient(
                    colors: [
                      AppTheme.redBright,
                      AppTheme.red,
                      AppTheme.redDeep,
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
            color: widget.secondary ? AppTheme.surfaceAlt : null,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: widget.secondary
                ? Border.all(color: AppTheme.divider)
                : null,
            boxShadow: widget.secondary
                ? []
                : [
                    BoxShadow(
                      color: AppTheme.red.withValues(alpha:0.35),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
          ),
          child: Center(
            child: widget.loading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    widget.label,
                    style: TextStyle(
                      color: widget.secondary
                          ? AppTheme.text
                          : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}