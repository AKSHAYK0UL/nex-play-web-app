// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:nex_play/core/enums/grid_movie_type.dart';
// import 'package:nex_play/core/enums/time_window.dart';
// import 'package:nex_play/core/paged_result/paged_resullt.dart';
// import 'package:nex_play/core/router/app_router.dart';
// import 'package:nex_play/core/widgets/image.dart';
// import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';
// import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_bloc.dart';
// import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_event.dart';
// import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_state.dart';
// import 'package:nex_play/features/shared/movie/presentation/bloc/similar_movies_bloc/similar_movies_bloc.dart';
// import 'package:nex_play/features/shared/movie/presentation/bloc/similar_movies_bloc/similar_movies_event.dart';
// import 'package:nex_play/features/shared/movie/presentation/bloc/similar_movies_bloc/similar_movies_state.dart';
// import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_bloc.dart';
// import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_event.dart';
// import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_state.dart';
// import 'package:nex_play/features/shared/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_bloc.dart';
// import 'package:nex_play/features/shared/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_event.dart';
// import 'package:nex_play/features/shared/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_state.dart';



// class GridMoviesParams {
//   final GridMoviesType type;
//   final String title;
//   final int? movieId; // required for similar/recommendation

//   const GridMoviesParams({
//     required this.type,
//     required this.title,
//     this.movieId,
//   });
// }

// class GridMoviesScreen extends StatelessWidget {
//   final GridMoviesParams params;

//   const GridMoviesScreen({super.key, required this.params});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF141416),
//       appBar: AppBar(
//         title: Text(
//           params.title,
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w700,
//             fontSize: 20,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: _buildBody(),
//     );
//   }

//   Widget _buildBody() {
//     switch (params.type) {
//       case GridMoviesType.trending:
//         return BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
//           builder: (context, state) {
//             return state.when(
//               initial: () => const SizedBox.shrink(),
//               loading: () => const Center(child: CircularProgressIndicator()),
//               error: (err) => Center(child: Text(err, style: const TextStyle(color: Colors.white))),
//               success: (movies) => _buildGridAndPagination(context, movies),
//             );
//           },
//         );
//       case GridMoviesType.topRated:
//         return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
//           builder: (context, state) {
//             return state.when(
//               initial: () => const SizedBox.shrink(),
//               loading: () => const Center(child: CircularProgressIndicator()),
//               error: (err) => Center(child: Text(err, style: const TextStyle(color: Colors.white))),
//               success: (movies) => _buildGridAndPagination(context, movies),
//             );
//           },
//         );
//       case GridMoviesType.similar:
//         return BlocBuilder<SimilarMoviesBloc, SimilarMoviesState>(
//           builder: (context, state) {
//             return state.when(
//               initial: () => const SizedBox.shrink(),
//               loading: () => const Center(child: CircularProgressIndicator()),
//               error: (err) => Center(child: Text(err, style: const TextStyle(color: Colors.white))),
//               success: (movies) => _buildGridAndPagination(context, movies),
//             );
//           },
//         );
//       case GridMoviesType.recommendation:
//         return BlocBuilder<MovieRecommendationsBloc, MovieRecommendationsState>(
//           builder: (context, state) {
//             return state.when(
//               initial: () => const SizedBox.shrink(),
//               loading: () => const Center(child: CircularProgressIndicator()),
//               error: (err) => Center(child: Text(err, style: const TextStyle(color: Colors.white))),
//               success: (movies) => _buildGridAndPagination(context, movies),
//             );
//           },
//         );
//     }
//   }

//   Widget _buildGridAndPagination(BuildContext context, PagedResullt<Movie> result) {
//     if (result.results.isEmpty) {
//       return const Center(
//         child: Text("No movies found", style: TextStyle(color: Colors.white54)),
//       );
//     }

//     return CustomScrollView(
//       physics: const BouncingScrollPhysics(),
//       slivers: [
//         SliverPadding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           sliver: SliverGrid(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.6,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//             ),
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {

//                 final movie = result.results[index];
//                 return _MovieGridCard(movie: movie);
//               },
//               childCount: result.results.length,
//             ),
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: _buildPagination(context, result),
//         ),
//       ],
//     );
//   }

//   Widget _buildPagination(BuildContext context, PagedResullt<Movie> result) {
//     final currentPage = result.page;
//     final totalPages = result.totalPage;

//     // Limit pages displayed, e.g., show around current page
//     int startPage = (currentPage - 2).clamp(1, totalPages);
//     int endPage = (currentPage + 2).clamp(1, totalPages);
    
//     // Ensure we always show up to 5 pages if available
//     if (endPage - startPage < 4 && totalPages >= 5) {
//       if (startPage == 1) {
//         endPage = 5.clamp(1, totalPages);
//       } else if (endPage == totalPages) {
//         startPage = (totalPages - 4).clamp(1, totalPages);
//       }
//     }

//     final pages = <int>[];
//     for (int i = startPage; i <= endPage; i++) {
//       pages.add(i);
//     }

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Previous button
//           IconButton(
//             onPressed: currentPage > 1 ? () => _fetchPage(context, currentPage - 1) : null,
//             icon: const Icon(Icons.arrow_back_ios_rounded, size: 16),
//             color: Colors.white,
//             disabledColor: Colors.white24,
//           ),
          
//           // Page numbers
//           ...pages.map((page) {
//             final isCurrent = page == currentPage;
//             return GestureDetector(
//               onTap: () {
//                 if (!isCurrent) _fetchPage(context, page);
//               },
//               child: Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 4),
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                 decoration: BoxDecoration(
//                   color: isCurrent ? Colors.white : Colors.transparent,
//                   borderRadius: BorderRadius.circular(8),
//                   border: isCurrent ? null : Border.all(color: Colors.white24),
//                 ),
//                 child: Text(
//                   page.toString(),
//                   style: TextStyle(
//                     color: isCurrent ? Colors.black : Colors.white,
//                     fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
//                   ),
//                 ),
//               ),
//             );
//           }),

//           // Next button
//           IconButton(
//             onPressed: currentPage < totalPages ? () => _fetchPage(context, currentPage + 1) : null,
//             icon: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
//             color: Colors.white,
//             disabledColor: Colors.white24,
//           ),
//         ],
//       ),
//     );
//   }

//   void _fetchPage(BuildContext context, int page) {
//     switch (params.type) {
//       case GridMoviesType.trending:
//         context.read<TrendingMoviesBloc>().add(
//           TrendingMoviesEvent.getTrending(lang: 'en-US', page: page, timeWindow: TimeWindow.week),
//         );
//         break;
//       case GridMoviesType.topRated:
//         context.read<TopRatedMoviesBloc>().add(
//           TopRatedMoviesEvent.getTopRatedMovies(lang: 'en-US', page: page),
//         );
//         break;
//       case GridMoviesType.similar:
//         if (params.movieId != null) {
//           context.read<SimilarMoviesBloc>().add(
//             SimilarMoviesEvent.getSimilarMovies(id: params.movieId!, lang: 'en-US', page: page),
//           );
//         }
//         break;
//       case GridMoviesType.recommendation:
//         if (params.movieId != null) {
//           context.read<MovieRecommendationsBloc>().add(
//             MovieRecommendationsEvent.getMoviesRecommendations(id: params.movieId!, lang: 'en-US', page: page),
//           );
//         }
//         break;
//     }
//   }
// }

// class _MovieGridCard extends StatelessWidget {
//   final Movie movie;

//   const _MovieGridCard({required this.movie});

//   @override
//   Widget build(BuildContext context) {
//     final hasPoster = (movie.posterPath ?? '').isNotEmpty;
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(16),
//         onTap: () => context.pushNamed(RouteName.movieDetailsScreen, extra: movie),
//         splashColor: Colors.white.withValues(alpha: 0.08),
//         highlightColor: Colors.white.withValues(alpha: 0.04),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withValues(alpha: 0.3),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(16),
//                   child: Stack(
//                     fit: StackFit.expand,
//                     children: [
//                       hasPoster
//                           ? AppImage(
//                               path: movie.posterPath!,
//                               size: 'w342',
//                               fit: BoxFit.cover,
//                             )
//                           : Container(color: const Color(0xFF1C1C1E)),
//                       if (movie.voteAverage != null && movie.voteAverage! > 0)
//                         Positioned(
//                           top: 8,
//                           left: 8,
//                           child: _ratingChip(rating: movie.voteAverage!),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               movie.title,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 13,
//                 fontWeight: FontWeight.w500,
//                 height: 1.25,
//                 letterSpacing: -0.1,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _ratingChip({required double rating}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
//       decoration: BoxDecoration(
//         color: Colors.black.withValues(alpha: 0.55),
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Icon(Icons.star_rounded, color: Color(0xFFFFD60A), size: 11),
//           const SizedBox(width: 3),
//           Text(
//             rating.toStringAsFixed(1),
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 10,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//###########################################################
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_play/core/enums/grid_movie_type.dart';
import 'package:nex_play/core/enums/time_window.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/core/router/app_router.dart';
import 'package:nex_play/core/widgets/image.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_state.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/similar_movies_bloc/similar_movies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/similar_movies_bloc/similar_movies_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/similar_movies_bloc/similar_movies_state.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_state.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_state.dart';

// Shared palette
const Color _kBackground = Color(0xFF141416);
const Color _kShimmerFill = Color(0xFF2C2C2E);
const Color _kShimmerBase = Color(0xFF232325);
const Color _kShimmerHighlight = Color(0xFF3A3A3D);
const Color _kAccentRed = Color(0xFFFF453A); // Apple system red

class GridMoviesParams {
  final GridMoviesType type;
  final String title;
  final int? movieId; // required for similar/recommendation

  const GridMoviesParams({
    required this.type,
    required this.title,
    this.movieId,
  });
}

class GridMoviesScreen extends StatelessWidget {
  final GridMoviesParams params;

  const GridMoviesScreen({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    const double expandedBarHeight = 110.0;

    return Scaffold(
      backgroundColor: _kBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ── CUSTOM COLLAPSIBLE SLIVER APP BAR ─────────────────────────────
          SliverAppBar(
            backgroundColor: _kBackground,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            pinned: true,
            stretch: true,
            expandedHeight: expandedBarHeight,
            automaticallyImplyLeading: false,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                final double top = constraints.biggest.height;
                final double minHeight = kToolbarHeight + statusBarHeight;

                // Calculate ratios for animations:
                // 1.0 = fully expanded, 0.0 = fully collapsed
                final double expandRatio =
                    ((top - minHeight) / (expandedBarHeight - kToolbarHeight))
                        .clamp(0.0, 1.0);
                final double collapseRatio = 1.0 - expandRatio;

                return Stack(
                  children: [
                    // 1. STATIC BACK BUTTON (Always visible & interactive)
                    Positioned(
                      left: 8,
                      top: statusBarHeight,
                      height: kToolbarHeight,
                      child: GestureDetector(
                        onTap: () {
                          if (context.canPop()) {
                            context.pop();
                          } else {
                            Navigator.of(context).maybePop();
                          }
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.arrow_back_ios_new,
                              color: _kAccentRed,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Opacity(
                              opacity: expandRatio,
                              child: const Text(
                                'Home',
                                style: TextStyle(
                                  color: _kAccentRed,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // 2. SMALL TITLE (Centered/Left in Toolbar - Fades in on collapse)
                    Positioned(
                      left: 0,
                      right: 0,
                      top: statusBarHeight,
                      height: kToolbarHeight,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 48, right: 16),
                        child: Opacity(
                          // Starts fading in after 80% of scroll completion
                          opacity: collapseRatio > 0.8
                              ? (collapseRatio - 0.8) / 0.2
                              : 0.0,
                          child: Text(
                            params.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // 3. BIG TITLE (Bottom Left - Fades out on collapse)
                    Positioned(
                      left: 20,
                      bottom: 12,
                      right: 20,
                      child: Opacity(
                        opacity: expandRatio,
                        child: Text(
                          params.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'serif',
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: -1.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // ── BODY CONTENT ──────────────────────────────────────────────────
          _buildBody(),
        ],
      ),
    );
  }

  // ── Body Logic (Handles BLoC states & Slivers) ─────────────────────────

  Widget _buildBody() {
    switch (params.type) {
      case GridMoviesType.trending:
        return BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              loading: () => const SliverFillRemaining(
                hasScrollBody: false,
                child: _GridShimmerLoading(),
              ),
              error: (err) => SliverFillRemaining(
                hasScrollBody: false,
                child: _GridErrorView(message: err),
              ),
              success: (movies) => _buildContentSlivers(context, movies),
            );
          },
        );
      case GridMoviesType.topRated:
        return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              loading: () => const SliverFillRemaining(
                hasScrollBody: false,
                child: _GridShimmerLoading(),
              ),
              error: (err) => SliverFillRemaining(
                hasScrollBody: false,
                child: _GridErrorView(message: err),
              ),
              success: (movies) => _buildContentSlivers(context, movies),
            );
          },
        );
      case GridMoviesType.similar:
        return BlocBuilder<SimilarMoviesBloc, SimilarMoviesState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              loading: () => const SliverFillRemaining(
                hasScrollBody: false,
                child: _GridShimmerLoading(),
              ),
              error: (err) => SliverFillRemaining(
                hasScrollBody: false,
                child: _GridErrorView(message: err),
              ),
              success: (movies) => _buildContentSlivers(context, movies),
            );
          },
        );
      case GridMoviesType.recommendation:
        return BlocBuilder<MovieRecommendationsBloc, MovieRecommendationsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              loading: () => const SliverFillRemaining(
                hasScrollBody: false,
                child: _GridShimmerLoading(),
              ),
              error: (err) => SliverFillRemaining(
                hasScrollBody: false,
                child: _GridErrorView(message: err),
              ),
              success: (movies) => _buildContentSlivers(context, movies),
            );
          },
        );
    }
  }

  Widget _buildContentSlivers(BuildContext context, PagedResullt<Movie> result) {
    if (result.results.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: _GridEmptyView(),
      );
    }

    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final movie = result.results[index];
                return _MovieGridCard(movie: movie);
              },
              childCount: result.results.length,
            ),
          ),
        ),
        SliverToBoxAdapter(child: _buildPagination(context, result)),
      ],
    );
  }

  Widget _buildPagination(BuildContext context, PagedResullt<Movie> result) {
    final currentPage = result.page;
    final totalPages = result.totalPage;

    if (totalPages <= 1) return const SizedBox(height: 8);

    const maxVisible = 5;
    int startPage = (currentPage - 3).clamp(1, totalPages);
    int endPage = (startPage + maxVisible - 1).clamp(1, totalPages);
    if (endPage - startPage + 1 < maxVisible) {
      startPage = (endPage - maxVisible + 1).clamp(1, totalPages);
    }

    final pages = [for (int i = startPage; i <= endPage; i++) i];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: const EdgeInsets.all(8),
            onPressed: currentPage > 1
                ? () => _fetchPage(context, currentPage - 1)
                : null,
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: _kAccentRed,
              size: 20,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final page in pages) ...[
                    _PageChip(
                      label: '$page',
                      isSelected: page == currentPage,
                      onTap: page == currentPage
                          ? null
                          : () => _fetchPage(context, page),
                    ),
                    if (page != pages.last) const SizedBox(width: 8),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            padding: const EdgeInsets.all(8),
            onPressed: currentPage < totalPages
                ? () => _fetchPage(context, currentPage + 1)
                : null,
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: _kAccentRed,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  void _fetchPage(BuildContext context, int page) {
    switch (params.type) {
      case GridMoviesType.trending:
        context.read<TrendingMoviesBloc>().add(
              TrendingMoviesEvent.getTrending(
                lang: 'en-US',
                page: page,
                timeWindow: TimeWindow.week,
              ),
            );
        break;
      case GridMoviesType.topRated:
        context.read<TopRatedMoviesBloc>().add(
              TopRatedMoviesEvent.getTopRatedMovies(lang: 'en-US', page: page),
            );
        break;
      case GridMoviesType.similar:
        if (params.movieId != null) {
          context.read<SimilarMoviesBloc>().add(
                SimilarMoviesEvent.getSimilarMovies(
                  id: params.movieId!,
                  lang: 'en-US',
                  page: page,
                ),
              );
        }
        break;
      case GridMoviesType.recommendation:
        if (params.movieId != null) {
          context.read<MovieRecommendationsBloc>().add(
                MovieRecommendationsEvent.getMoviesRecommendations(
                  id: params.movieId!,
                  lang: 'en-US',
                  page: page,
                ),
              );
        }
        break;
    }
  }
}

// ── Movie Card Item ─────────────────────────────────────────────────────

class _MovieGridCard extends StatelessWidget {
  final Movie movie;

  const _MovieGridCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    final hasPoster = (movie.posterPath ?? '').isNotEmpty;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.pushNamed(RouteName.movieDetailsScreen, extra: movie),
        splashColor: Colors.white.withValues(alpha: 0.08),
        highlightColor: Colors.white.withValues(alpha: 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      hasPoster
                          ? AppImage(
                              path: movie.posterPath!,
                              size: 'w342',
                              fit: BoxFit.cover,
                            )
                          : Container(color: const Color(0xFF1C1C1E)),
                      if (movie.voteAverage != null && movie.voteAverage! > 0)
                        Positioned(
                          top: 8,
                          left: 8,
                          child: _ratingChip(rating: movie.voteAverage!),
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
    );
  }

  Widget _ratingChip({required double rating}) {
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

// ── Pagination Chip Widget ────────────────────────────────────────────────

class _PageChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const _PageChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(19);
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        color: isSelected ? _kAccentRed : Colors.white.withValues(alpha: 0.1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: RoundedRectangleBorder(borderRadius: radius),
          onTap: onTap,
          child: Container(
            constraints: const BoxConstraints(minWidth: 38),
            height: 38,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                letterSpacing: -0.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Shimmer & Empty States ────────────────────────────────────────────────

class _GridShimmerLoading extends StatelessWidget {
  const _GridShimmerLoading();

  @override
  Widget build(BuildContext context) {
    return _Shimmer(
      child: GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 6,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _shimmerBox(borderRadius: 16)),
            const SizedBox(height: 8),
            _shimmerBox(height: 12, borderRadius: 4),
            const SizedBox(height: 6),
            _shimmerBox(width: 80, height: 12, borderRadius: 4),
          ],
        ),
      ),
    );
  }
}

Widget _shimmerBox({
  double? width,
  double? height,
  required double borderRadius,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: _kShimmerFill,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
  );
}

class _Shimmer extends StatefulWidget {
  final Widget child;
  const _Shimmer({required this.child});

  @override
  State<_Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<_Shimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

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
            colors: const [_kShimmerBase, _kShimmerHighlight, _kShimmerBase],
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

class _GridErrorView extends StatelessWidget {
  final String message;
  const _GridErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              color: Colors.white.withValues(alpha: 0.3),
              size: 34,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class _GridEmptyView extends StatelessWidget {
  const _GridEmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.movie_outlined,
            color: Colors.white.withValues(alpha: 0.24),
            size: 38,
          ),
          const SizedBox(height: 12),
          const Text(
            "No movies found",
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
        ],
      ),
    );
  }
}