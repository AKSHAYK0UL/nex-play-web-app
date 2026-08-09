import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_play/core/widgets/glass_action_button.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movie_detailed_bloc/movie_detailed_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movie_detailed_bloc/movie_detailed_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movie_detailed_bloc/movie_detailed_state.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/similar_movies_bloc/similar_movies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/similar_movies_bloc/similar_movies_event.dart';
import 'package:nex_play/features/shared/movie/presentation/widgets/action_row.dart';
import 'package:nex_play/features/shared/movie/presentation/widgets/back_drop.dart';
import 'package:nex_play/features/shared/movie/presentation/widgets/detail_error_section.dart';
import 'package:nex_play/features/shared/movie/presentation/widgets/detail_loading_section.dart';
import 'package:nex_play/features/shared/movie/presentation/widgets/genre_chips.dart';
import 'package:nex_play/features/shared/movie/presentation/widgets/info_grid.dart';
import 'package:nex_play/features/shared/movie/presentation/widgets/recommendations_section.dart';
import 'package:nex_play/features/shared/movie/presentation/widgets/similar_section.dart';
import 'package:nex_play/features/shared/movie/presentation/widgets/title_row.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailScreen({super.key, required this.movie});

  static const accent = Color(0xFFE50914);

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
    context.read<SimilarMoviesBloc>().add(
      SimilarMoviesEvent.getSimilarMovies(
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
                  child: buildGlassActionButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: () => context.pop(),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [StretchMode.zoomBackground],

                  background: buildBackdrop(movie: movie),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitleRow(movie: movie),
                      const SizedBox(height: 22),
                      buildActionRow(
                        context: context,
                        accent: MovieDetailScreen.accent,
                        movie: movie,
                        isLoading: isLoadingDetails,
                      ),
                      const SizedBox(height: 26),
                      if (errorMessage != null)
                        DetailErrorSection(
                          message: errorMessage,
                          onRetry: _fetchDetails,
                        )
                      else if (isLoadingDetails)
                        const DetailLoadingSection()
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
                          buildGenreChip(genres: movie.genres!),
                          const SizedBox(height: 30),
                        ],
                        buildInfoGrid(context: context, movie: movie),
                        const SizedBox(height: 30),

                        //recommendation section
                        RecommendationsSection(),
                        //similar section
                        const SizedBox(height: 20),
                        SimilarSection(),
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
