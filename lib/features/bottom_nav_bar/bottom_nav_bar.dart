import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nex_play/features/home/presentation/screens/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: IndexedStack(index: _currentIndex, children: _screens),
      ),

      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 12, 12, 13),
            border: Border(
              top: BorderSide(
                color: Colors.white.withValues(alpha: 0.06),
                width: 2,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 7),
          child: GNav(
            rippleColor: Colors.white.withValues(alpha: 0.08),
            hoverColor: Colors.white.withValues(alpha: 0.04),
            haptic: true,
            tabBorderRadius: 18,
            curve: Curves.easeOutCubic,
            duration: const Duration(milliseconds: 300),
            gap: 8,
            color: Colors.white54,
            activeColor: Colors.white,
            iconSize: 22,

            tabBackgroundColor: Colors.white.withValues(alpha: 0.08),
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.1,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            onTabChange: (idx) {
              setState(() => _currentIndex = idx);
            },
            selectedIndex: _currentIndex,
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.movie, text: 'Movies'),
              GButton(icon: Icons.search, text: 'Search'),
              GButton(icon: Icons.web_stories, text: 'Web Series'),
              GButton(icon: Icons.account_circle, text: 'You'),
            ],
          ),
        ),
      ),
    );
  }
}
