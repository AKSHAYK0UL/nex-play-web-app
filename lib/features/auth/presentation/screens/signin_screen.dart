import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_play/core/router/app_router.dart';
import 'package:nex_play/core/theme/app_theme.dart';
import 'package:nex_play/core/utils/validators.dart';
import 'package:nex_play/core/widgets/snackbar.dart';
import 'package:nex_play/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nex_play/features/auth/presentation/bloc/auth_event.dart';
import 'package:nex_play/features/auth/presentation/bloc/auth_state.dart';
import 'package:nex_play/features/auth/presentation/widgets/auth_button.dart';
import 'package:nex_play/features/auth/presentation/widgets/custom_textfeild.dart';

class SigninScreen extends StatefulWidget {
  final VoidCallback? onGoSignUp;

  const SigninScreen({super.key, this.onGoSignUp});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscurePass = true;
  late AnimationController _shakeCtrl;
  late Animation<double> _shakeAnim;

  @override
  void initState() {
    super.initState();
    _shakeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _shakeAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _shakeCtrl, curve: Curves.elasticIn));
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _shakeCtrl.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      HapticFeedback.mediumImpact();
      _shakeCtrl.forward(from: 0);
      return;
    }
    context.read<AuthBloc>().add(
      AuthEvent.signIn(
        email: _emailCtrl.text.trim(),
        password: _passCtrl.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous != current,

      listener: (context, state) {
        state.maybeWhen(
          success: () => context.go(RoutePath.homeScreen),
          error: (error) {
            showSnack(context, error);
          },
          orElse: () {},
        );
      },
      buildWhen: (previous, current) => previous != current,

      builder: (context, state) {
        final loading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome\nback!',
                  style: TextStyle(
                    color: AppTheme.text,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Sign in to continue watching.',
                  style: TextStyle(
                    color: AppTheme.textSub,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 36),

                AnimatedBuilder(
                  animation: _shakeAnim,
                  builder: (_, child) => Transform.translate(
                    offset: Offset(
                      math.sin(_shakeAnim.value * math.pi * 4) *
                          8 *
                          (1 - _shakeAnim.value),
                      0,
                    ),
                    child: child,
                  ),
                  child: Column(
                    children: [
                      CustomTextfeild(
                        controller: _emailCtrl,
                        label: 'Email Address',
                        hint: 'you@example.com',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,

                        prefixIcon: Icons.mail_outline_rounded,

                        validator: (_) =>
                            Validators.email(_emailCtrl.text.trim()),
                      ),
                      const SizedBox(height: 14),
                      CustomTextfeild(
                        controller: _passCtrl,
                        label: 'Password',
                        hint: '••••••••',
                        obscure: _obscurePass,
                        textInputAction: TextInputAction.done,

                        prefixIcon: Icons.lock_outline_rounded,
                        suffixIcon: _obscurePass
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        onSuffixTap: () =>
                            setState(() => _obscurePass = !_obscurePass),
                      ),
                    ],
                  ),
                ),

                // Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () =>context.push(RoutePath.forgotPassword),
                    style: TextButton.styleFrom(
                      foregroundColor: AppTheme.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 10,
                      ),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AuthButton(
                  label: "Sign In",
                  loading: loading,
                  onTap: _onSubmit,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
