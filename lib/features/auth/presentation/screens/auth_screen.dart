import 'package:flutter/material.dart';
import 'package:nex_play/core/theme/app_theme.dart';
import 'package:nex_play/features/auth/presentation/screens/signin_screen.dart';
import 'package:nex_play/features/auth/presentation/screens/signup_screen.dart';
import 'package:nex_play/features/auth/presentation/widgets/auth_logo.dart';
import 'package:nex_play/features/auth/presentation/widgets/back_button.dart';
import 'package:nex_play/features/auth/presentation/widgets/tab_switcher.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: SafeArea(
        child: Column(
          children: [
            backButton(context),
            authLogo(),
            const SizedBox(height: 28),
            tabSwitcher(context, _tabCtrl),
            const SizedBox(height: 28),
            Expanded(
              child: TabBarView(
                controller: _tabCtrl,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SigninScreen(
                    // onSuccess: widget.onSignInSuccess,
                    onGoSignUp: () => _tabCtrl.animateTo(1),
                  ),

                  SignupScreen(onGoSignIn: () => _tabCtrl.animateTo(0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
