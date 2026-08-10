import 'package:flutter/material.dart';
import 'package:nex_play/features/home/presentation/widgets/carousel_slider.dart';
import 'package:nex_play/features/home/presentation/widgets/top_rated_section.dart';
import 'package:nex_play/features/home/presentation/widgets/trending_section.dart';
import 'package:nex_play/features/home/presentation/widgets/upcoming_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 12, 15, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Nex Play',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
                Row(
                  children: [
                    _HeaderIconButton(icon: Icons.search, onTap: () {}),
                    const SizedBox(width: 8),
                    _HeaderIconButton(icon: Icons.person_outline, onTap: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 24),
            child: BuildCarouselSlider(),
          ),
        ),

        // const SliverToBoxAdapter(child: BuildUpcomingMoviesList()),
        const SliverToBoxAdapter(child: BuildTrendingList()),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        const SliverToBoxAdapter(child: BuildTopRatedMoviesList()),
      ],
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _HeaderIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.08),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        splashColor: Colors.white.withValues(alpha: 0.1),
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
