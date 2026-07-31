
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_play/core/router/app_router.dart';
import 'package:nex_play/features/movie/domain/entities/movie.dart';
import 'package:nex_play/features/movie/presentation/bloc/nowplaying_movies_bloc/bloc/nowplaymovies_bloc.dart';
import 'package:nex_play/features/movie/presentation/bloc/nowplaying_movies_bloc/bloc/nowplaymovies_state.dart';

class BuildCarouselSlider extends StatelessWidget {
  const BuildCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayMoviesBloc, NowPlayMoviesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const _CarouselLoading(),
          error: (error) => _CarouselError(message: error),
          success: (movies) {
            final list = movies.results.take(20).toList();
            if (list.isEmpty) return const SizedBox.shrink();
            return _CarouselContent(movies: list);
          },
        );
      },
    );
  }
}

class _CarouselContent extends StatefulWidget {
  final List<Movie> movies;
  const _CarouselContent({required this.movies});

  @override
  State<_CarouselContent> createState() => _CarouselContentState();
}

class _CarouselContentState extends State<_CarouselContent> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          itemCount: widget.movies.length,
          itemBuilder: (context, index, realIndex) {
            final isActive = index == _currentIndex;
            return AnimatedScale(
              duration: const Duration(milliseconds: 320),
              curve: Curves.easeOutCubic,
              scale: isActive ? 1.0 : 0.93,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 320),
                curve: Curves.easeOut,
                opacity: isActive ? 1.0 : 0.55,
                child: _CarouselCard(movie: widget.movies[index]),
              ),
            );
          },
          options: CarouselOptions(
            height: height * 0.6,
            viewportFraction: 0.78,
            initialPage: 0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 6),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInOutCubic,
            pauseAutoPlayOnTouch: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.22,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
        ),
        const SizedBox(height: 14),
        _PillIndicator(
          count: widget.movies.length,
          currentIndex: _currentIndex,
        ),
      ],
    );
  }
}

class _CarouselCard extends StatelessWidget {
  final Movie movie;
  const _CarouselCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha:0.35),
              blurRadius: 24,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: 'movie-poster-${movie.id}',
                child: Image.network(
                  "https://image.tmdb.org/t/p/w780${movie.posterPath}",
                  fit: BoxFit.fill,
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
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.55, 1.0],
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha:0.05),
                        Colors.black.withValues(alpha:0.80),
                      ],
                    ),
                  ),
                ),
              ),

              // Title + rating overlay.
              Positioned(
                left: 16,
                right: 16,
                bottom: 18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (movie.voteAverage != null && movie.voteAverage! > 0)
                      _RatingBadge(rating: movie.voteAverage!),
                    const SizedBox(height: 8),
                    Text(
                      movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.3,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(22),
                    onTap: () => context.pushNamed(
                      RouteName.movieDetailsScreen,
                      extra: movie,
                    ),
                    splashColor: Colors.white.withValues(alpha:0.08),
                    highlightColor: Colors.white.withValues(alpha:0.04),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  final double rating;
  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:0.16),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha:0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, color: Color(0xFFFFD60A), size: 14),
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _PillIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  const _PillIndicator({required this.count, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: 6,
          width: isActive ? 20 : 6,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.white.withValues(alpha:0.28),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}

//  Loading state: shimmer skeleton 


class _CarouselLoading extends StatelessWidget {
  const _CarouselLoading();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cardHeight = size.height * 0.6;
    final cardWidth = size.width * 0.78;

    return SizedBox(
      height: cardHeight,
      child: _Shimmer(
        child: Center(
          child: _ShimmerBox(
            width: cardWidth,
            height: cardHeight,
            borderRadius: 22,
          ),
        ),
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

// Sweeps a soft highlight band left-to-right, on loop,
// dependency needed).
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

class _CarouselError extends StatelessWidget {
  final String message;
  const _CarouselError({required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
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