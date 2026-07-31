
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_play/core/router/app_router.dart';
import 'package:nex_play/features/movie/domain/entities/movie.dart';
import 'package:nex_play/features/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_bloc.dart';
import 'package:nex_play/features/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_state.dart';

class BuildTrendingList extends StatelessWidget {
  const BuildTrendingList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const _TrendingLoading(),
          error: (error) => _TrendingError(message: error),
          success: (movies) {
            final list = movies.results.take(10).toList();
            if (list.isEmpty) return const SizedBox.shrink();
            return _TrendingContent(movies: list);
          },
        );
      },
    );
  }
}

class _TrendingContent extends StatelessWidget {
  final List<Movie> movies;
  const _TrendingContent({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 16, 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Trending Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.4,
                ),
              ),
              _ArrowButton(
                onTap: () {
                  
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 234,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const BouncingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: _TrendingCard(movie: movies[index]),
            ),
          ),
        ),
      ],
    );
  }
}

class _TrendingCard extends StatelessWidget {
  final Movie movie;
  const _TrendingCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 128,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () =>
              context.pushNamed(RouteName.movieDetailsScreen, extra: movie),
          splashColor: Colors.white.withValues(alpha: 0.08),
          highlightColor: Colors.white.withValues(alpha: 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 2 / 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Hero(
                          
                          tag: 'trending-poster-${movie.id}',
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w342${movie.posterPath}",
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return Container(
                                color: const Color(0xFF1C1C1E),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white54,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (_, __, ___) => Container(
                              color: const Color(0xFF1C1C1E),
                              child: const Center(
                                child: Icon(
                                  Icons.broken_image_outlined,
                                  color: Colors.white30,
                                  size: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (movie.voteAverage != null && movie.voteAverage! > 0)
                          Positioned(
                            top: 8,
                            left: 8,
                            child: _RatingChip(rating: movie.voteAverage!),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                  letterSpacing: -0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RatingChip extends StatelessWidget {
  final double rating;
  const _RatingChip({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, color: Color(0xFFFFD60A), size: 11),
          const SizedBox(width: 3),
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}


class _ArrowButton extends StatelessWidget {
  final VoidCallback onTap;
  const _ArrowButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.08),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        splashColor: Colors.white.withValues(alpha: 0.1),
        highlightColor: Colors.white.withValues(alpha: 0.04),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 14,
          ),
        ),
      ),
    );
  }
}

//  Loading state: shimmer skeleton

class _TrendingLoading extends StatelessWidget {
  const _TrendingLoading();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 234,
      child: _Shimmer(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics:  NeverScrollableScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.only(right: 12),
            child: _TrendingShimmerCard(),
          ),
        ),
      ),
    );
  }
}

class _TrendingShimmerCard extends StatelessWidget {
  const _TrendingShimmerCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 128,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: _ShimmerBox(borderRadius: 16),
          ),
          const SizedBox(height: 8),
          const _ShimmerBox(width: 128, height: 12, borderRadius: 4),
          const SizedBox(height: 6),
          const _ShimmerBox(width: 76, height: 12, borderRadius: 4),
        ],
      ),
    );
  }
}

// Solid placeholder block. 
class _ShimmerBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;

  const _ShimmerBox({this.width, this.height, this.borderRadius = 8});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

// Sweeps a soft highlight band left-to-right, on looP
class _Shimmer extends StatefulWidget {
  final Widget child;
  const _Shimmer({required this.child});

  @override
  State<_Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<_Shimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const _baseColor = Color(0xFF232325);
  static const _highlightColor = Color(0xFF3A3A3D);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(
            colors: const [_baseColor, _highlightColor, _baseColor],
            stops: const [0.35, 0.5, 0.65],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            transform: _SlidingGradientTransform(_controller.value),
          ).createShader(bounds),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  final double slidePercent;
  const _SlidingGradientTransform(this.slidePercent);

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(
      bounds.width * (slidePercent * 3 - 1.5),
      0.0,
      0.0,
    );
  }
}

class _TrendingError extends StatelessWidget {
  final String message;
  const _TrendingError({required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 234,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white54, fontSize: 14),
          ),
        ),
      ),
    );
  }
}