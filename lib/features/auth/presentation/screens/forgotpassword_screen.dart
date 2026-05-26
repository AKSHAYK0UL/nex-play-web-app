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
import 'package:nex_play/features/auth/presentation/widgets/back_button.dart';
import 'package:nex_play/features/auth/presentation/widgets/custom_textfeild.dart';
import 'package:nex_play/features/auth/presentation/widgets/forgotpassowrd_header.dart';
import 'package:nex_play/features/auth/presentation/widgets/icon_mark.dart';
import 'package:nex_play/features/auth/presentation/widgets/password_strength_bar.dart';

class ForgotpasswordScreen extends StatefulWidget {
  const ForgotpasswordScreen({super.key});

  @override
  State<ForgotpasswordScreen> createState() => _ForgotpasswordScreenState();
}

class _ForgotpasswordScreenState extends State<ForgotpasswordScreen>
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
      duration: Duration(milliseconds: 500),
    );
    _shakeAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _shakeCtrl, curve: Curves.elasticIn));
    _passCtrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _shakeCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      HapticFeedback.mediumImpact();
      _shakeCtrl.forward(from: 0);
      return;
    }

    context.read<AuthBloc>().add(
      AuthEvent.forgotPassword(email: _emailCtrl.text.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous != current,

      listener: (context, state) {
        state.maybeWhen(
          verify: (email) => context.push(
            RoutePath.verifyScreen,
            extra: {"email": email, "password": _passCtrl.text.trim()},
          ),
          error: (error) => showSnack(context, error),
          orElse: () {},
        );
      },
      buildWhen: (previous, current) => previous != current,

      builder: (context, state) {
        final loading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        return Scaffold(
          backgroundColor: AppTheme.bg,
          body: Column(
            children: [
              Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 25),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: backButton(context),
                      ),
                    ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  physics: const BouncingScrollPhysics(),
                  child: SafeArea(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                
                          iconMark(Icons.lock_reset_rounded),
                          const SizedBox(height: 28),
                          forgotPasswordHeader(),
                          const SizedBox(height: 40),
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
                                  label: 'New Password',
                                  hint: 'Minimum 8 characters',
                                  obscure: _obscurePass,
                                  prefixIcon: Icons.lock_outline_rounded,
                                  suffixIcon: _obscurePass
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  onSuffixTap: () =>
                                      setState(() => _obscurePass = !_obscurePass),
                                  validator: (_) =>
                                      Validators.password(_passCtrl.text.trim()),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: _passCtrl.text.isNotEmpty,
                            child: PasswordStrengthBar(
                              password: _passCtrl.text.trim(),
                            ),
                          ),
                
                          const SizedBox(height: 24),
                          // Create Account Button
                          AuthButton(
                            label: 'Send Reset Code',
                            loading: loading,
                            onTap: _submit,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
