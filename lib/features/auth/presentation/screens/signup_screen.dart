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
import 'package:nex_play/features/auth/presentation/widgets/password_strength_bar.dart';
import 'package:nex_play/features/auth/presentation/widgets/terms_and_conditions.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback? onGoSignIn;

  const SignupScreen({super.key, this.onGoSignIn});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscurePass = true;
  bool _agreedToTerms = false;
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
    _nameCtrl.dispose();
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
    if (!_agreedToTerms) {
      HapticFeedback.mediumImpact();
      showSnack(context, 'Please agree to the Terms to continue.');
      return;
    }

    context.read<AuthBloc>().add(
      AuthEvent.signUp(
        name: _nameCtrl.text.trim(),
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
          verify: (email) => context.push(RoutePath.verifyScreen, extra:  {"email": email, "password": ""}),
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
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create\nyour account.',
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
                  'Join millions watching right now.',
                  style: TextStyle(color: AppTheme.textSub, fontSize: 15),
                ),
                const SizedBox(height: 32),

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
                        controller: _nameCtrl,
                        label: 'Full Name',
                        hint: 'Your name',
                        prefixIcon: Icons.person_outline_rounded,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        validator: (_) =>
                            Validators.username(_nameCtrl.text.trim()),
                      ),
                      const SizedBox(height: 14),
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
                  child: PasswordStrengthBar(password: _passCtrl.text.trim()),
                ),
                const SizedBox(height: 20),
                TermsAndConditions(
                  agreedToTerms: _agreedToTerms,
                  onChanged: (val) => setState(() => _agreedToTerms = val),
                ),
                const SizedBox(height: 24),
                // Create Account Button
                AuthButton(
                  label: 'Create Account',
                  loading: loading,
                  onTap: _submit,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
