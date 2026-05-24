import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_play/core/router/app_router.dart';
import 'package:nex_play/core/theme/app_theme.dart';
import 'package:nex_play/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nex_play/features/auth/presentation/bloc/auth_event.dart';
import 'package:nex_play/features/auth/presentation/bloc/auth_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          loggedOut: () => context.go(RoutePath.landingPage),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: AppTheme.bg,
        body: Center(
          child: TextButton.icon(
            onPressed: () =>
                context.read<AuthBloc>().add(const AuthEvent.logout()),
            icon: const Icon(Icons.logout_rounded, color: AppTheme.red),
            label: const Text(
              'Logout',
              style: TextStyle(color: AppTheme.red),
            ),
          ),
        ),
      ),
    );
  }
}