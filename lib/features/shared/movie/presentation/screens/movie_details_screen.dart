import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_play/core/router/app_router.dart';
import 'package:nex_play/features/shared/movie/domain/entities/genre.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movie_detailed_bloc/movie_detailed_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movie_detailed_bloc/movie_detailed_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movie_detailed_bloc/movie_detailed_state.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_state.dart';
import 'package:nex_play/features/shared/widgets/horzontial_movie_list.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailScreen({super.key, required this.movie});

  static const _accent = Color(0xFFE50914);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    _fetchDetails();
  }

  void _fetchDetails() {
    context.read<MovieDetailedBloc>().add(
      MovieDetailedEvent.getMovieDetails(id: widget.movie.id, lang: 'en-US'),
    );

    context.read<MovieRecommendationsBloc>().add(
      MovieRecommendationsEvent.getMoviesRecommendations(
        id: widget.movie.id,
        lang: 'en-US',
        page: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailedBloc, MovieDetailedState>(
      builder: (context, state) {
        final movie = state.maybeWhen(
          success: (movie) => movie,
          orElse: () => widget.movie,
        );
        final isLoadingDetails = state.maybeWhen(
          success: (_) => false,
          orElse: () => true,
        );
        final errorMessage = state.maybeWhen(
          error: (error) => error,
          orElse: () => null,
        );

        return Scaffold(
          backgroundColor: Colors.black,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                stretch: true,
                backgroundColor: Colors.black,
                expandedHeight: 340,
                leadingWidth: 64,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 6),
                  child: _GlassIconButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: () => context.pop(),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [StretchMode.zoomBackground],

                  background: _Backdrop(movie: widget.movie),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TitleRow(movie: movie),
                      const SizedBox(height: 22),
                      _ActionRow(
                        accent: MovieDetailScreen._accent,
                        movie: movie,
                      ),
                      const SizedBox(height: 26),
                      if (errorMessage != null)
                        _DetailErrorSection(
                          message: errorMessage,
                          onRetry: _fetchDetails,
                        )
                      else if (isLoadingDetails)
                        const _DetailLoadingSection()
                      else ...[
                        if ((movie.overview ?? '').isNotEmpty) ...[
                          Text(
                            movie.overview!,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                              height: 1.5,
                              letterSpacing: 0.1,
                            ),
                          ),
                          const SizedBox(height: 26),
                        ],
                        if ((movie.genres ?? []).isNotEmpty) ...[
                          _GenreChips(genres: movie.genres!),
                          const SizedBox(height: 30),
                        ],
                        _InfoGrid(movie: movie),
                        const SizedBox(height: 30),

                        //recommendation section
                        _RecommendationsSection(),
                        //similar section
                      ],
                    ],
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

class _Backdrop extends StatelessWidget {
  final Movie movie;
  const _Backdrop({required this.movie});

  @override
  Widget build(BuildContext context) {
    final path = movie.backdropPath ?? movie.posterPath;
    return Stack(
      fit: StackFit.expand,
      children: [
        if (path != null)
          Image.network(
            "https://image.tmdb.org/t/p/original$path",
            fit: BoxFit.fill,
            errorBuilder: (_, __, ___) =>
                Container(color: const Color(0xFF1C1C1E)),
          )
        else
          Container(color: const Color(0xFF1C1C1E)),

        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.5, 1.0],
              colors: [
                Colors.black.withValues(alpha: 0.45),
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _GlassIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Material(
          color: Colors.white.withValues(alpha: 0.14),
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: Icon(icon, color: Colors.white, size: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleRow extends StatelessWidget {
  final Movie movie;
  const _TitleRow({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: 'movie-poster-${movie.id}',
          child: Container(
            width: 92,
            height: 138,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: movie.posterPath != null
                  ? Image.network(
                      "https://image.tmdb.org/t/p/w342${movie.posterPath}",

                      fit: BoxFit.fill,
                      errorBuilder: (_, __, ___) =>
                          Container(color: const Color(0xFF1C1C1E)),
                    )
                  : Container(color: const Color(0xFF1C1C1E)),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                movie.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.4,
                  height: 1.15,
                ),
              ),
              if ((movie.tagline ?? '').isNotEmpty) ...[
                const SizedBox(height: 6),
                Text(
                  movie.tagline!,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
              const SizedBox(height: 10),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                runSpacing: 6,
                children: [
                  if (movie.voteAverage != null && movie.voteAverage! > 0)
                    _RatingPill(rating: movie.voteAverage!),
                  if (_year(movie.releaseDate) != null)
                    _MetaText(_year(movie.releaseDate)!),
                  if (movie.runtime != null && movie.runtime! > 0)
                    _MetaText(_formatRuntime(movie.runtime!)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RatingPill extends StatelessWidget {
  final double rating;
  const _RatingPill({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star_rounded, color: Color(0xFFFFD60A), size: 15),
        const SizedBox(width: 3),
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _MetaText extends StatelessWidget {
  final String text;
  const _MetaText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white.withValues(alpha: 0.6),
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  final Color accent;
  final Movie movie;
  const _ActionRow({required this.accent, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            color: accent,
            borderRadius: BorderRadius.circular(14),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () => context.pushNamed(
                RouteName.streamScreen,
                extra: movie.streamUrl,
              ),
              splashColor: Colors.white.withValues(alpha: 0.15),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Play',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        _CircleAction(icon: Icons.add_rounded, onTap: () {}),
        const SizedBox(width: 10),
        _CircleAction(icon: Icons.favorite_border, onTap: () {}),
      ],
    );
  }
}

class _CircleAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _CircleAction({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.1),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}

class _GenreChips extends StatelessWidget {
  final List<Genre> genres;
  const _GenreChips({required this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: genres.take(4).map((g) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
          ),

          child: Text(
            g.name,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _InfoGrid extends StatelessWidget {
  final Movie movie;
  const _InfoGrid({required this.movie});

  @override
  Widget build(BuildContext context) {
    final items = <MapEntry<String, String>>[
      if ((movie.releaseDate ?? '').isNotEmpty)
        MapEntry('Release date', _formatDate(movie.releaseDate!)),
      if ((movie.status ?? '').isNotEmpty) MapEntry('Status', movie.status!),
      if ((movie.originalLanguage ?? '').isNotEmpty)
        MapEntry('Language', movie.originalLanguage!.toUpperCase()),
      if (movie.voteCount != null && movie.voteCount! > 0)
        MapEntry('Ratings', _formatCount(movie.voteCount!)),
    ];

    if (items.isEmpty) return const SizedBox.shrink();

    final columnWidth = (MediaQuery.of(context).size.width - 40 - 28) / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Info',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.85),
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 28,
          runSpacing: 18,
          children: items.map((e) {
            return SizedBox(
              width: columnWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.key,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.4),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    e.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _DetailLoadingSection extends StatefulWidget {
  const _DetailLoadingSection();

  @override
  State<_DetailLoadingSection> createState() => _DetailLoadingSectionState();
}

class _DetailLoadingSectionState extends State<_DetailLoadingSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  late final Animation<double> _pulse = Tween<double>(
    begin: 0.3,
    end: 0.85,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _bar({double width = double.infinity, double height = 13}) {
    return FadeTransition(
      opacity: _pulse,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(height / 2),
        ),
      ),
    );
  }

  Widget _chip(double width) {
    return FadeTransition(
      opacity: _pulse,
      child: Container(
        width: width,
        height: 28,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _infoCell() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bar(width: 70, height: 11),
        const SizedBox(height: 6),
        _bar(width: 110, height: 14),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bar(),
        const SizedBox(height: 9),
        _bar(),
        const SizedBox(height: 9),
        _bar(width: 160),
        const SizedBox(height: 26),

        Row(
          children: [
            _chip(70),
            const SizedBox(width: 8),
            _chip(86),
            const SizedBox(width: 8),
            _chip(64),
          ],
        ),
        const SizedBox(height: 30),

        _bar(width: 60, height: 15),
        const SizedBox(height: 14),

        Row(
          children: [
            Expanded(child: _infoCell()),
            const SizedBox(width: 28),
            Expanded(child: _infoCell()),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            Expanded(child: _infoCell()),
            const SizedBox(width: 28),
            Expanded(child: _infoCell()),
          ],
        ),
      ],
    );
  }
}

class _DetailErrorSection extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _DetailErrorSection({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: Colors.white.withValues(alpha: 0.6),
            size: 28,
          ),
          const SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 13.5,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          TextButton(
            onPressed: onRetry,
            style: TextButton.styleFrom(
              foregroundColor: MovieDetailScreen._accent,
            ),
            child: const Text(
              'Try again',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

//recommendation section
class _RecommendationsSection extends StatelessWidget {
  const _RecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieRecommendationsBloc, MovieRecommendationsState>(
      buildWhen: (previous, current) => current != previous,
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => HorzontialMovieListLoading(),
          error: (err) => HorzontialMovieListError(message: err),
          success: (movies) {
            final list = movies.results.take(10).toList();
            if (list.isEmpty) return const SizedBox.shrink();
            return HorzontialMovieListContent(title:"You Might Like",movies: list, navTo: () {});
          },
        );
      },
    );
  }
}

String _formatRuntime(int minutes) {
  final h = minutes ~/ 60;
  final m = minutes % 60;
  if (h == 0) return '${m}m';
  if (m == 0) return '${h}h';
  return '${h}h ${m}m';
}

String? _year(String? date) {
  if (date == null || date.length < 4) return null;
  return date.substring(0, 4);
}

const _months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

String _formatDate(String date) {
  try {
    final parsed = DateTime.parse(date);
    return '${_months[parsed.month - 1]} ${parsed.day}, ${parsed.year}';
  } catch (_) {
    return date;
  }
}

String _formatCount(int count) {
  if (count >= 1000) return '${(count / 1000).toStringAsFixed(1)}K';
  return '$count';
}
