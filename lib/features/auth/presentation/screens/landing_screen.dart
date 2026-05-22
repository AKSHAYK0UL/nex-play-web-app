import 'package:flutter/material.dart';

import 'package:nex_play/features/auth/presentation/widgets/continue_button.dart';
import 'package:nex_play/features/auth/presentation/widgets/logo_badge.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fadeIn;
  late final Animation<Offset> _slideUp;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _fadeIn = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
    );

    _slideUp = Tween<Offset>(begin: const Offset(0, 0.18), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _ctrl,
            curve: const Interval(0.3, 1.0, curve: Curves.easeOutCubic),
          ),
        );

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/landing_image.png', fit: BoxFit.fill),

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0, -0.1),
                colors: [Color(0xCC000000), Colors.transparent],
              ),
            ),
          ),

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment(0, 0.05),
                colors: [
                  Color(0xFF000000),
                  Color(0xE8000000),
                  Color(0xB0000000),
                  Colors.transparent,
                ],
                stops: [0.0, 0.28, 0.54, 1.0],
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: FadeTransition(opacity: _fadeIn, child: LogoBadge()),
                ),

                const Spacer(),

                SlideTransition(
                  position: _slideUp,
                  child: FadeTransition(
                    opacity: _fadeIn,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Title
                          const Text(
                            'Every Story\nBegins Here.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: '.SF Pro Display',
                              fontSize: 38,
                              fontWeight: FontWeight.w700,
                              color: Colors.white70,
                              height: 1.12,
                              letterSpacing: -1.2,
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Subtitle
                          Text(
                            'Unlimited films, series, and originals\ncurated for the curious mind.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: '.SF Pro Text',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withValues(alpha: 0.62),
                              height: 1.55,
                              letterSpacing: 0.1,
                            ),
                          ),

                          const SizedBox(height: 20),

                          ContinueButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
