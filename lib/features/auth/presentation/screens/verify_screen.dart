// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:nex_play/core/constants/api_const.dart';
// import 'package:nex_play/core/router/app_router.dart';
// import 'package:nex_play/core/theme/app_theme.dart';
// import 'package:nex_play/features/auth/presentation/bloc/auth_bloc.dart';
// import 'package:nex_play/features/auth/presentation/bloc/auth_event.dart';
// import 'package:nex_play/features/auth/presentation/bloc/auth_state.dart';
// import 'package:nex_play/features/auth/presentation/widgets/auth_button.dart';
// import 'package:nex_play/features/auth/presentation/widgets/back_button.dart';
// import 'package:nex_play/features/auth/presentation/widgets/icon_mark.dart';
// import 'package:nex_play/features/auth/presentation/widgets/otp_boxes.dart';
// import 'package:nex_play/features/auth/presentation/widgets/verify_header_text.dart';

// class VerifyScreen extends StatefulWidget {
//   final String email;
//   final String password;
//   const VerifyScreen({super.key, required this.email, this.password = ""});

//   @override
//   State<VerifyScreen> createState() => _VerifyScreenState();
// }

// class _VerifyScreenState extends State<VerifyScreen>
//     with TickerProviderStateMixin {
//   //OTP textfeilds
//   final List<TextEditingController> _controllers = List.generate(
//     AuthAPI.otpCodeLenght,
//     (_) => TextEditingController(),
//   );

//   final List<FocusNode> _focusNodes = List.generate(
//     AuthAPI.otpCodeLenght,
//     (_) => FocusNode(),
//   );

//   //Resend Timer
//   static const _timerDuration = 60;
//   int _timerRemaining = _timerDuration;
//   bool _canResend = false;
//   Timer? _timer;

//   late AnimationController _entryCtrl;
//   late AnimationController _shakeCtrl;

//   late Animation<double> _entryFade;
//   late Animation<Offset> _entrySlide;
//   late Animation<double> _shakeAnim;

//   bool _hasError = false;
//   String? _errorMessage;

//   @override
//   void initState() {
//     super.initState();

//     _entryCtrl = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//     _entryFade = CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOut);
//     _entrySlide = Tween<Offset>(
//       begin: const Offset(0, 0.06),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOutCubic));

//     _shakeCtrl = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 450),
//     );
//     _shakeAnim = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _shakeCtrl, curve: Curves.elasticIn));

//     _entryCtrl.forward();

//     //
//     _startTimer();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _focusNodes[0].requestFocus();
//     });
//   }

//   //timer
//   void _startTimer() {
//     _timer?.cancel();
//     setState(() {
//       _timerRemaining = _timerDuration;
//       _canResend = false;
//     });
//     _timer = Timer.periodic(const Duration(seconds: 1), (t) {
//       if (!mounted) {
//         t.cancel();
//         return;
//       }
//       setState(() {
//         if (_timerRemaining > 0) {
//           _timerRemaining--;
//         } else {
//           _canResend = true;
//           t.cancel();
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     for (final c in _controllers) {
//       c.dispose();
//     }
//     for (final f in _focusNodes) {
//       f.dispose();
//     }
//     _timer?.cancel();
//     _entryCtrl.dispose();
//     _shakeCtrl.dispose();
//     super.dispose();
//   }

//   //Input
//   void _onDigitEntered(int index, String value) {
//     setState(() {
//       _hasError = false;
//       _errorMessage = "";
//     });
//     final clean = value.replaceAll(RegExp(r'[^0-9]'), '');
//     if (clean.isEmpty) {
//       _controllers[index].clear();
//       if (index > 0) {
//         _focusNodes[index - 1].requestFocus();
//         return;
//       }
//     }

//     // Paste: fill all boxes at once
//     if (clean.length == AuthAPI.otpCodeLenght) {
//       for (int i = 0; i < AuthAPI.otpCodeLenght; i++) {
//         _controllers[i].text = clean[i];
//       }
//       _focusNodes[AuthAPI.otpCodeLenght - 1].requestFocus();
//       _maybeAutoSubmit();
//       return;
//     }
//     _controllers[index].text = clean[clean.length - 1];
//     if (index < AuthAPI.otpCodeLenght - 1) {
//       _focusNodes[index + 1].requestFocus();
//     } else {
//       _focusNodes[index].unfocus();
//       _maybeAutoSubmit();
//     }
//   }

//   void _onBackspace(int index) {
//     setState(() {
//       _hasError = false;
//       _errorMessage = "";
//     });
//     if (_controllers[index].text.isEmpty && index > 0) {
//       _controllers[index - 1].clear();
//       _focusNodes[index - 1].requestFocus();
//     }
//   }

//   void _maybeAutoSubmit() {
//     setState(() {
//       _hasError = false;
//       _errorMessage = "";
//     });
//     if (_controllers.every((c) => c.text.isNotEmpty)) {
//       _submitOTP();
//     }
//   }

//   //verify
//   void _submitOTP() {
//     final otpCode = _controllers.map((c) => c.text).join();
//     if (otpCode.length < AuthAPI.otpCodeLenght) {
//       setState(() {
//         _hasError = true;
//         _errorMessage = "incomplete OTP";
//       });
//       _buildErrorBanner();
//       return;
//     }
//     ;
//     HapticFeedback.lightImpact();

//     if (widget.password.isEmpty) {
//       context.read<AuthBloc>().add(
//         AuthEvent.verify(email: widget.email, otp: otpCode),
//       );
//     } else {
//       context.read<AuthBloc>().add(
//         AuthEvent.resetPassword(
//           email: widget.email,
//           otp: otpCode,
//           newPassword: widget.password,
//         ),
//       );
//     }
//   }

//   void _clearFields() {
//     for (final c in _controllers) {
//       c.clear();
//     }
//     setState(() {
//       _hasError = false;
//       _errorMessage = "";
//     }); // rebuild to reflect empty state
//     _focusNodes[0].requestFocus();
//   }

//   Future<void> _resendCode() async {
//     if (!_canResend) return;
//     HapticFeedback.selectionClick();
//     _clearFields();
//     _startTimer();

//     context.read<AuthBloc>().add(
//       AuthEvent.resentOTP(
//         email: widget.email,
//         purpose: widget.password.isEmpty ? "signup" : "reset_password",
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AuthBloc, AuthState>(
//       listenWhen: (prev, curr) => prev != curr,
//       listener: (context, state) {
//         state.maybeWhen(
//           success: () => context.go(RoutePath.bottomNavbar),
//           error: (error) {
//             setState(() {
//               _hasError = true;
//               _errorMessage = error;
//             });
//             _shakeCtrl.forward(from: 0);
//           },
//           orElse: () {},
//         );
//       },
//       builder: (context, state) {
//         final loading = state.maybeWhen(
//           loading: () => true,
//           orElse: () => false,
//         );
//         return Scaffold(
//           backgroundColor: AppTheme.bg,
//           body: SafeArea(
//             child: FadeTransition(
//               opacity: _entryFade,
//               child: SlideTransition(
//                 position: _entrySlide,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: backButton(context),
//                       ),
//                     ),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         physics: const BouncingScrollPhysics(),
//                         padding: const EdgeInsets.symmetric(horizontal: 28),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(height: 24),
//                             iconMark(Icons.mark_email_read_outlined),
//                             const SizedBox(height: 28),
//                             verifyHeaderText(widget.email),
//                             const SizedBox(height: 44),
//                             otpBoxes(
//                               shakeAnim: _shakeAnim,
//                               focusNodes: _focusNodes,
//                               controllers: _controllers,
//                               hasError: _hasError,
//                               onDigitEntered: _onDigitEntered,
//                               onBackspace: _onBackspace,
//                             ),
//                             const SizedBox(height: 16),
//                             _buildErrorBanner(),
//                             const SizedBox(height: 36),
//                             AuthButton(
//                               label: 'Verify & Continue',
//                               loading: loading,
//                               onTap: _submitOTP,
//                             ),
//                             const SizedBox(height: 32),
//                             _buildResendSection(),
//                             const SizedBox(height: 40),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildErrorBanner() {
//     if (!_hasError || _errorMessage == null) return const SizedBox.shrink();
//     return Text(
//       _errorMessage!,
//       style: const TextStyle(
//         color: Color(0xFFFF4444),
//         fontSize: 13,
//         height: 1.4,
//       ),
//     );
//   }

//   Widget _buildResendSection() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "Didn't receive the code? ",
//           style: const TextStyle(color: AppTheme.textSub, fontSize: 14),
//         ),
//         GestureDetector(
//           onTap: _canResend ? _resendCode : null,
//           child: Text(
//             _canResend ? 'Resend' : 'Resend in ${_timerRemaining}s',
//             style: TextStyle(
//               color: _canResend ? AppTheme.red : AppTheme.textDim,
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


//#######################################
import 'dart:async';
import 'dart:ui'; // Added for BackdropFilter

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_play/core/constants/api_const.dart';
import 'package:nex_play/core/router/app_router.dart';
import 'package:nex_play/core/theme/app_theme.dart';
import 'package:nex_play/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nex_play/features/auth/presentation/bloc/auth_event.dart';
import 'package:nex_play/features/auth/presentation/bloc/auth_state.dart';
import 'package:nex_play/features/auth/presentation/widgets/auth_button.dart';
import 'package:nex_play/features/auth/presentation/widgets/back_button.dart';
import 'package:nex_play/features/auth/presentation/widgets/icon_mark.dart';
import 'package:nex_play/features/auth/presentation/widgets/otp_boxes.dart';
import 'package:nex_play/features/auth/presentation/widgets/verify_header_text.dart';

class VerifyScreen extends StatefulWidget {
  final String email;
  final String password;
  const VerifyScreen({super.key, required this.email, this.password = ""});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen>
    with TickerProviderStateMixin {
  //OTP textfeilds
  final List<TextEditingController> _controllers = List.generate(
    AuthAPI.otpCodeLenght,
    (_) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(
    AuthAPI.otpCodeLenght,
    (_) => FocusNode(),
  );

  //Resend Timer
  static const _timerDuration = 60;
  int _timerRemaining = _timerDuration;
  bool _canResend = false;
  Timer? _timer;

  late AnimationController _entryCtrl;
  late AnimationController _shakeCtrl;

  late Animation<double> _entryFade;
  late Animation<Offset> _entrySlide;
  late Animation<double> _shakeAnim;

  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();

    _entryCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _entryFade = CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOut);
    _entrySlide = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOutCubic));

    _shakeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _shakeAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _shakeCtrl, curve: Curves.elasticIn));

    _entryCtrl.forward();

    //
    _startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  //timer
  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _timerRemaining = _timerDuration;
      _canResend = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      setState(() {
        if (_timerRemaining > 0) {
          _timerRemaining--;
        } else {
          _canResend = true;
          t.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    _timer?.cancel();
    _entryCtrl.dispose();
    _shakeCtrl.dispose();
    super.dispose();
  }

  //Input
  void _onDigitEntered(int index, String value) {
    setState(() {
      _hasError = false;
      _errorMessage = "";
    });
    final clean = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (clean.isEmpty) {
      _controllers[index].clear();
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
        return;
      }
    }

    // Paste: fill all boxes at once
    if (clean.length == AuthAPI.otpCodeLenght) {
      for (int i = 0; i < AuthAPI.otpCodeLenght; i++) {
        _controllers[i].text = clean[i];
      }
      _focusNodes[AuthAPI.otpCodeLenght - 1].requestFocus();
      _maybeAutoSubmit();
      return;
    }
    _controllers[index].text = clean[clean.length - 1];
    if (index < AuthAPI.otpCodeLenght - 1) {
      _focusNodes[index + 1].requestFocus();
    } else {
      _focusNodes[index].unfocus();
      _maybeAutoSubmit();
    }
  }

  void _onBackspace(int index) {
    setState(() {
      _hasError = false;
      _errorMessage = "";
    });
    if (_controllers[index].text.isEmpty && index > 0) {
      _controllers[index - 1].clear();
      _focusNodes[index - 1].requestFocus();
    }
  }

  void _maybeAutoSubmit() {
    setState(() {
      _hasError = false;
      _errorMessage = "";
    });
    if (_controllers.every((c) => c.text.isNotEmpty)) {
      _submitOTP();
    }
  }

  //verify
  void _submitOTP() {
    final otpCode = _controllers.map((c) => c.text).join();
    if (otpCode.length < AuthAPI.otpCodeLenght) {
      setState(() {
        _hasError = true;
        _errorMessage = "incomplete OTP";
      });
      _buildErrorBanner();
      return;
    }
    
    HapticFeedback.lightImpact();

    if (widget.password.isEmpty) {
      context.read<AuthBloc>().add(
        AuthEvent.verify(email: widget.email, otp: otpCode),
      );
    } else {
      context.read<AuthBloc>().add(
        AuthEvent.resetPassword(
          email: widget.email,
          otp: otpCode,
          newPassword: widget.password,
        ),
      );
    }
  }

  void _clearFields() {
    for (final c in _controllers) {
      c.clear();
    }
    setState(() {
      _hasError = false;
      _errorMessage = "";
    }); // rebuild to reflect empty state
    _focusNodes[0].requestFocus();
  }

  Future<void> _resendCode() async {
    if (!_canResend) return;
    HapticFeedback.selectionClick();
    _clearFields();
    _startTimer();

    context.read<AuthBloc>().add(
      AuthEvent.resentOTP(
        email: widget.email,
        purpose: widget.password.isEmpty ? "signup" : "reset_password",
      ),
    );
  }

  // Custom Exit Dialog Logic
  Future<bool?> _showExitDialog() {
    HapticFeedback.mediumImpact();
    return showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.bg.withOpacity(0.9), // Glass effect background
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.red.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.warning_amber_rounded,
                      color: AppTheme.red,
                      size: 36,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Exit Verification?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Are you sure you want to exit?\n\nIf you try signing up with this email later and get an 'Email already exists' error, simply go to the Forgot Password screen. Enter your email and a new password to verify and fix the issue.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.textSub,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            "Stay",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, true),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.red,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            "Exit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Intercepting custom back button
  void _handleBackNavigation() async {
    final bool shouldPop = await _showExitDialog() ?? false;
    if (shouldPop && mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (prev, curr) => prev != curr,
      listener: (context, state) {
        state.maybeWhen(
          success: () => context.go(RoutePath.bottomNavbar),
          error: (error) {
            setState(() {
              _hasError = true;
              _errorMessage = error;
            });
            _shakeCtrl.forward(from: 0);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final loading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        return PopScope(
          // Prevents system back button (Android swipe/hardware button)
          canPop: false,
          onPopInvoked: (didPop) async {
            if (didPop) return;
            _handleBackNavigation();
          },
          child: Scaffold(
            backgroundColor: AppTheme.bg,
            body: SafeArea(
              child: FadeTransition(
                opacity: _entryFade,
                child: SlideTransition(
                  position: _entrySlide,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          // Hijack the custom backButton touch event
                          child: GestureDetector(
                            onTap: _handleBackNavigation,
                            behavior: HitTestBehavior.opaque,
                            child: AbsorbPointer(
                              child: backButton(context),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 24),
                              iconMark(Icons.mark_email_read_outlined),
                              const SizedBox(height: 28),
                              verifyHeaderText(widget.email),
                              const SizedBox(height: 44),
                              otpBoxes(
                                shakeAnim: _shakeAnim,
                                focusNodes: _focusNodes,
                                controllers: _controllers,
                                hasError: _hasError,
                                onDigitEntered: _onDigitEntered,
                                onBackspace: _onBackspace,
                              ),
                              const SizedBox(height: 16),
                              _buildErrorBanner(),
                              const SizedBox(height: 36),
                              AuthButton(
                                label: 'Verify & Continue',
                                loading: loading,
                                onTap: _submitOTP,
                              ),
                              const SizedBox(height: 32),
                              _buildResendSection(),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorBanner() {
    if (!_hasError || _errorMessage == null) return const SizedBox.shrink();
    return Text(
      _errorMessage!,
      style: const TextStyle(
        color: Color(0xFFFF4444),
        fontSize: 13,
        height: 1.4,
      ),
    );
  }

  Widget _buildResendSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Didn't receive the code? ",
          style: TextStyle(color: AppTheme.textSub, fontSize: 14),
        ),
        GestureDetector(
          onTap: _canResend ? _resendCode : null,
          child: Text(
            _canResend ? 'Resend' : 'Resend in ${_timerRemaining}s',
            style: TextStyle(
              color: _canResend ? AppTheme.red : AppTheme.textDim,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}