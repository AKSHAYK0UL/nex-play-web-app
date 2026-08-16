// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:nex_play/core/enums/grid_movie_type.dart';
// import 'package:nex_play/core/enums/time_window.dart';
// import 'package:nex_play/core/paged_result/paged_resullt.dart';
// import 'package:nex_play/core/router/app_router.dart';
// import 'package:nex_play/core/di/injection.dart';
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

// // Shared palette
// const Color _kBackground =  Colors.black;
// const Color _kShimmerFill = Color(0xFF2C2C2E);
// const Color _kShimmerBase = Color(0xFF232325);
// const Color _kShimmerHighlight = Color(0xFF3A3A3D);
// const Color _kAccentRed = Color(0xFFFF453A);

// class GridMoviesParams {
//   final GridMoviesType type;
//   final String title;
//   final int? movieId;

//   const GridMoviesParams({
//     required this.type,
//     required this.title,
//     this.movieId,
//   });
// }

// class GridMoviesScreen extends StatefulWidget {
//   final GridMoviesParams params;

//   const GridMoviesScreen({super.key, required this.params});

//   @override
//   State<GridMoviesScreen> createState() => _GridMoviesScreenState();
// }

// class _GridMoviesScreenState extends State<GridMoviesScreen> {
//   TrendingMoviesBloc? _trendingBloc;
//   TopRatedMoviesBloc? _topRatedBloc;
//   SimilarMoviesBloc? _similarBloc;
//   MovieRecommendationsBloc? _recommendationsBloc;

//   @override
//   void initState() {
//     super.initState();
//     switch (widget.params.type) {
//       case GridMoviesType.trending:
//         _trendingBloc = sl<TrendingMoviesBloc>()
//           ..add(
//             const TrendingMoviesEvent.getTrending(
//               lang: 'en-US',
//               page: 1,
//               timeWindow: TimeWindow.week,
//             ),
//           );
//         break;
//       case GridMoviesType.topRated:
//         _topRatedBloc = sl<TopRatedMoviesBloc>()
//           ..add(
//             const TopRatedMoviesEvent.getTopRatedMovies(lang: 'en-US', page: 1),
//           );
//         break;
//       case GridMoviesType.similar:
//         if (widget.params.movieId != null) {
//           _similarBloc = sl<SimilarMoviesBloc>()
//             ..add(
//               SimilarMoviesEvent.getSimilarMovies(
//                 id: widget.params.movieId!,
//                 lang: 'en-US',
//                 page: 1,
//               ),
//             );
//         }
//         break;
//       case GridMoviesType.recommendation:
//         if (widget.params.movieId != null) {
//           _recommendationsBloc = sl<MovieRecommendationsBloc>()
//             ..add(
//               MovieRecommendationsEvent.getMoviesRecommendations(
//                 id: widget.params.movieId!,
//                 lang: 'en-US',
//                 page: 1,
//               ),
//             );
//         }
//         break;
//     }
//   }

//   @override
//   void dispose() {
//     _trendingBloc?.close();
//     _topRatedBloc?.close();
//     _similarBloc?.close();
//     _recommendationsBloc?.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double statusBarHeight = MediaQuery.of(context).padding.top;
//     const double expandedBarHeight = 96.0;

//     return Scaffold(
//       backgroundColor: _kBackground,
//       body: SafeArea(
//         top: false,
//         child: CustomScrollView(
//           physics: const BouncingScrollPhysics(),
//           slivers: [
//             SliverAppBar(
//               backgroundColor: _kBackground,
//               surfaceTintColor: Colors.transparent,
//               elevation: 0,
//               pinned: true,
//               stretch: true,
//               expandedHeight: expandedBarHeight,
//               automaticallyImplyLeading: false,
//               flexibleSpace: LayoutBuilder(
//                 builder: (context, constraints) {
//                   final double top = constraints.biggest.height;
//                   final double minHeight = kToolbarHeight + statusBarHeight;
        
//                   // Calculate ratios for animations:
//                   // 1.0 = fully expanded, 0.0 = fully collapsed
//                   final double expandRatio =
//                       ((top - minHeight) / (expandedBarHeight - kToolbarHeight))
//                           .clamp(0.0, 1.0);
//                   final double collapseRatio = (1.0 - expandRatio).clamp(
//                     0.0,
//                     1.0,
//                   );
        
//                   final double smallTitleOpacity =
//                       (collapseRatio > 0.7 ? (collapseRatio - 0.7) / 0.3 : 0.0)
//                           .clamp(0.0, 1.0);
        
//                   return Stack(
//                     children: [
//                       //  BIG TITLE
//                       Positioned(
//                         left: 16,
//                         bottom: 8,
//                         right: 16,
//                         child: Opacity(
//                           opacity: expandRatio.clamp(0.0, 1.0),
//                           child: Text(
//                             widget.params.title,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                               fontFamily: 'serif',
//                               fontSize: 23,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                               letterSpacing: -0.8,
//                             ),
//                           ),
//                         ),
//                       ),
        
//                       //  SMALL TITLE
//                       Positioned(
//                         left: 0,
//                         right: 0,
//                         top: statusBarHeight,
//                         height: kToolbarHeight,
//                         child: IgnorePointer(
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             margin: const EdgeInsets.only(left: 45, right: 16),
//                             child: Opacity(
//                               opacity: smallTitleOpacity,
//                               child: Text(
//                                 widget.params.title,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.white,
//                                   letterSpacing: -0.3,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
        
//                       // STATIC BACK BUTTON
//                       Positioned(
//                         left: 8,
//                         top: statusBarHeight + (kToolbarHeight - 36) / 2,
//                         height: 36,
//                         child: GestureDetector(
//                           onTap: () {
//                             if (Navigator.of(context).canPop()) {
//                               Navigator.of(context).pop();
//                             } else if (context.canPop()) {
//                               context.pop();
//                             } else {
//                               context.go(RoutePath.bottomNavbar);
//                             }
//                           },
//                           behavior: HitTestBehavior.opaque,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 const Icon(
//                                   Icons.arrow_back_ios_new,
//                                   color: _kAccentRed,
//                                   size: 20,
//                                 ),
//                                 const SizedBox(width: 4),
//                                 Opacity(
//                                   opacity: expandRatio.clamp(0.0, 1.0),
//                                   child: const Text(
//                                     'Back',
//                                     style: TextStyle(
//                                       color: _kAccentRed,
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
        
//             // BODY CONTENT
//             _buildBody(),
//           ],
//         ),
//       ),
//     );
//   }

//   //  Body

//   Widget _buildBody() {
//     switch (widget.params.type) {
//       case GridMoviesType.trending:
//         return BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
//           bloc: _trendingBloc,
//           builder: (context, state) {
//             return state.when(
//               initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
//               loading: () => _buildLoadingGrid(),
//               error: (err) => SliverFillRemaining(
//                 hasScrollBody: false,
//                 child: _GridErrorView(message: err),
//               ),
//               success: (movies) => _buildContentSlivers(context, movies),
//             );
//           },
//         );
//       case GridMoviesType.topRated:
//         return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
//           bloc: _topRatedBloc,
//           builder: (context, state) {
//             return state.when(
//               initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
//               loading: () => _buildLoadingGrid(),
//               error: (err) => SliverFillRemaining(
//                 hasScrollBody: false,
//                 child: _GridErrorView(message: err),
//               ),
//               success: (movies) => _buildContentSlivers(context, movies),
//             );
//           },
//         );
//       case GridMoviesType.similar:
//         return BlocBuilder<SimilarMoviesBloc, SimilarMoviesState>(
//           bloc: _similarBloc,
//           builder: (context, state) {
//             return state.when(
//               initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
//               loading: () => _buildLoadingGrid(),
//               error: (err) => SliverFillRemaining(
//                 hasScrollBody: false,
//                 child: _GridErrorView(message: err),
//               ),
//               success: (movies) => _buildContentSlivers(context, movies),
//             );
//           },
//         );
//       case GridMoviesType.recommendation:
//         return BlocBuilder<MovieRecommendationsBloc, MovieRecommendationsState>(
//           bloc: _recommendationsBloc,
//           builder: (context, state) {
//             return state.when(
//               initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
//               loading: () => _buildLoadingGrid(),
//               error: (err) => SliverFillRemaining(
//                 hasScrollBody: false,
//                 child: _GridErrorView(message: err),
//               ),
//               success: (movies) => _buildContentSlivers(context, movies),
//             );
//           },
//         );
//     }
//   }

//   Widget _buildLoadingGrid() {
//     return SliverPadding(
//       padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
//       sliver: SliverGrid(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 0.6,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         delegate: SliverChildBuilderDelegate(
//           (context, index) => const _GridShimmerItem(),
//           childCount: 6,
//         ),
//       ),
//     );
//   }

//   Widget _buildContentSlivers(
//     BuildContext context,
//     PagedResullt<Movie> result,
//   ) {
//     if (result.results.isEmpty) {
//       return const SliverFillRemaining(
//         hasScrollBody: false,
//         child: _GridEmptyView(),
//       );
//     }

//     return SliverMainAxisGroup(
//       slivers: [
//         SliverPadding(
//           padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
//           sliver: SliverGrid(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.6,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//             ),
//             delegate: SliverChildBuilderDelegate((context, index) {
//               final movie = result.results[index];
//               return _MovieGridCard(movie: movie);
//             }, childCount: result.results.length),
//           ),
//         ),
//         SliverToBoxAdapter(child: _buildPagination(context, result)),
//       ],
//     );
//   }

//   Widget _buildPagination(BuildContext context, PagedResullt<Movie> result) {
//     final currentPage = result.page;
//     final totalPages = result.totalPage;

//     if (totalPages <= 1) return const SizedBox(height: 8);

//     const maxVisible = 5;
//     int startPage = (currentPage - 3).clamp(1, totalPages);
//     int endPage = (startPage + maxVisible - 1).clamp(1, totalPages);
//     if (endPage - startPage + 1 < maxVisible) {
//       startPage = (endPage - maxVisible + 1).clamp(1, totalPages);
//     }

//     final pages = [for (int i = startPage; i <= endPage; i++) i];

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             padding: const EdgeInsets.all(8),
//             onPressed: currentPage > 1
//                 ? () => _fetchPage(context, currentPage - 1)
//                 : null,
//             icon: const Icon(
//               Icons.arrow_back_ios_rounded,
//               color: _kAccentRed,
//               size: 20,
//             ),
//           ),
//           const SizedBox(width: 8),
//           Flexible(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               physics: const BouncingScrollPhysics(),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   for (final page in pages) ...[
//                     _PageChip(
//                       label: '$page',
//                       isSelected: page == currentPage,
//                       onTap: page == currentPage
//                           ? null
//                           : () => _fetchPage(context, page),
//                     ),
//                     if (page != pages.last) const SizedBox(width: 8),
//                   ],
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(width: 8),
//           IconButton(
//             padding: const EdgeInsets.all(8),
//             onPressed: currentPage < totalPages
//                 ? () => _fetchPage(context, currentPage + 1)
//                 : null,
//             icon: const Icon(
//               Icons.arrow_forward_ios_rounded,
//               color: _kAccentRed,
//               size: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _fetchPage(BuildContext context, int page) {
//     switch (widget.params.type) {
//       case GridMoviesType.trending:
//         _trendingBloc?.add(
//           TrendingMoviesEvent.getTrending(
//             lang: 'en-US',
//             page: page,
//             timeWindow: TimeWindow.week,
//           ),
//         );
//         break;
//       case GridMoviesType.topRated:
//         _topRatedBloc?.add(
//           TopRatedMoviesEvent.getTopRatedMovies(lang: 'en-US', page: page),
//         );
//         break;
//       case GridMoviesType.similar:
//         if (widget.params.movieId != null) {
//           _similarBloc?.add(
//             SimilarMoviesEvent.getSimilarMovies(
//               id: widget.params.movieId!,
//               lang: 'en-US',
//               page: page,
//             ),
//           );
//         }
//         break;
//       case GridMoviesType.recommendation:
//         if (widget.params.movieId != null) {
//           _recommendationsBloc?.add(
//             MovieRecommendationsEvent.getMoviesRecommendations(
//               id: widget.params.movieId!,
//               lang: 'en-US',
//               page: page,
//             ),
//           );
//         }
//         break;
//     }
//   }
// }

// // Movie Card

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
//         onTap: () =>
//             context.pushNamed(RouteName.movieDetailsScreen, extra: movie),
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

// //  Pagination Chip Widget

// class _PageChip extends StatelessWidget {
//   final String label;
//   final bool isSelected;
//   final VoidCallback? onTap;

//   const _PageChip({
//     required this.label,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final radius = BorderRadius.circular(19);
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: radius,
//         color: isSelected ? _kAccentRed : Colors.white.withValues(alpha: 0.1),
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           customBorder: RoundedRectangleBorder(borderRadius: radius),
//           onTap: onTap,
//           child: Container(
//             constraints: const BoxConstraints(minWidth: 38),
//             height: 38,
//             alignment: Alignment.center,
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Text(
//               label,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//                 fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
//                 letterSpacing: -0.2,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //  Shimmer & Error & Empty States

// class _GridShimmerItem extends StatelessWidget {
//   const _GridShimmerItem();

//   @override
//   Widget build(BuildContext context) {
//     return _Shimmer(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: _kShimmerFill,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             height: 12,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: _kShimmerFill,
//               borderRadius: BorderRadius.circular(4),
//             ),
//           ),
//           const SizedBox(height: 6),
//           Container(
//             height: 12,
//             width: 80,
//             decoration: BoxDecoration(
//               color: _kShimmerFill,
//               borderRadius: BorderRadius.circular(4),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _Shimmer extends StatefulWidget {
//   final Widget child;
//   const _Shimmer({required this.child});

//   @override
//   State<_Shimmer> createState() => _ShimmerState();
// }

// class _ShimmerState extends State<_Shimmer>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return ShaderMask(
//           blendMode: BlendMode.srcATop,
//           shaderCallback: (bounds) => LinearGradient(
//             colors: const [_kShimmerBase, _kShimmerHighlight, _kShimmerBase],
//             stops: const [0.2, 0.5, 0.8],
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//             transform: _SlidingGradientTransform(_controller.value),
//           ).createShader(bounds),
//           child: child,
//         );
//       },
//       child: widget.child,
//     );
//   }
// }

// class _SlidingGradientTransform extends GradientTransform {
//   final double slidePercent;
//   const _SlidingGradientTransform(this.slidePercent);

//   @override
//   Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
//     return Matrix4.translationValues(
//       bounds.width * (slidePercent * 3 - 1.5),
//       0.0,
//       0.0,
//     );
//   }
// }

// class _GridErrorView extends StatelessWidget {
//   final String message;
//   const _GridErrorView({required this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 32),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               Icons.wifi_off_rounded,
//               color: Colors.white.withValues(alpha: 0.3),
//               size: 34,
//             ),
//             const SizedBox(height: 12),
//             Text(
//               message,
//               textAlign: TextAlign.center,
//               style: const TextStyle(color: Colors.white54, fontSize: 14),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _GridEmptyView extends StatelessWidget {
//   const _GridEmptyView();

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             Icons.movie_outlined,
//             color: Colors.white.withValues(alpha: 0.24),
//             size: 38,
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             "No movies found",
//             style: TextStyle(color: Colors.white54, fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }
// }




//#########################################################################################################
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_play/core/enums/grid_movie_type.dart';
import 'package:nex_play/core/enums/time_window.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/core/router/app_router.dart';
import 'package:nex_play/core/di/injection.dart';
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
const Color _kBackground =  Colors.black;
const Color _kShimmerFill = Color(0xFF2C2C2E);
const Color _kShimmerBase = Color(0xFF232325);
const Color _kShimmerHighlight = Color(0xFF3A3A3D);
const Color _kAccentRed = Color(0xFFFF453A);

class GridMoviesParams {
  final GridMoviesType type;
  final String title;
  final int? movieId;

  const GridMoviesParams({
    required this.type,
    required this.title,
    this.movieId,
  });
}

class GridMoviesScreen extends StatefulWidget {
  final GridMoviesParams params;

  const GridMoviesScreen({super.key, required this.params});

  @override
  State<GridMoviesScreen> createState() => _GridMoviesScreenState();
}

class _GridMoviesScreenState extends State<GridMoviesScreen> {
  TrendingMoviesBloc? _trendingBloc;
  TopRatedMoviesBloc? _topRatedBloc;
  SimilarMoviesBloc? _similarBloc;
  MovieRecommendationsBloc? _recommendationsBloc;

  // Controls the CustomScrollView so we can reset it to the top
  // whenever the user switches page.
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    switch (widget.params.type) {
      case GridMoviesType.trending:
        _trendingBloc = sl<TrendingMoviesBloc>()
          ..add(
            const TrendingMoviesEvent.getTrending(
              lang: 'en-US',
              page: 1,
              timeWindow: TimeWindow.week,
            ),
          );
        break;
      case GridMoviesType.topRated:
        _topRatedBloc = sl<TopRatedMoviesBloc>()
          ..add(
            const TopRatedMoviesEvent.getTopRatedMovies(lang: 'en-US', page: 1),
          );
        break;
      case GridMoviesType.similar:
        if (widget.params.movieId != null) {
          _similarBloc = sl<SimilarMoviesBloc>()
            ..add(
              SimilarMoviesEvent.getSimilarMovies(
                id: widget.params.movieId!,
                lang: 'en-US',
                page: 1,
              ),
            );
        }
        break;
      case GridMoviesType.recommendation:
        if (widget.params.movieId != null) {
          _recommendationsBloc = sl<MovieRecommendationsBloc>()
            ..add(
              MovieRecommendationsEvent.getMoviesRecommendations(
                id: widget.params.movieId!,
                lang: 'en-US',
                page: 1,
              ),
            );
        }
        break;
    }
  }

  @override
  void dispose() {
    _trendingBloc?.close();
    _topRatedBloc?.close();
    _similarBloc?.close();
    _recommendationsBloc?.close();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    const double expandedBarHeight = 96.0;

    return Scaffold(
      backgroundColor: _kBackground,
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
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
                  final double collapseRatio = (1.0 - expandRatio).clamp(
                    0.0,
                    1.0,
                  );
        
                  final double smallTitleOpacity =
                      (collapseRatio > 0.7 ? (collapseRatio - 0.7) / 0.3 : 0.0)
                          .clamp(0.0, 1.0);
        
                  return Stack(
                    children: [
                      //  BIG TITLE
                      Positioned(
                        left: 16,
                        bottom: 8,
                        right: 16,
                        child: Opacity(
                          opacity: expandRatio.clamp(0.0, 1.0),
                          child: Text(
                            widget.params.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'serif',
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: -0.8,
                            ),
                          ),
                        ),
                      ),
        
                      //  SMALL TITLE
                      Positioned(
                        left: 0,
                        right: 0,
                        top: statusBarHeight,
                        height: kToolbarHeight,
                        child: IgnorePointer(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 45, right: 16),
                            child: Opacity(
                              opacity: smallTitleOpacity,
                              child: Text(
                                widget.params.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
        
                      // STATIC BACK BUTTON
                      Positioned(
                        left: 8,
                        top: statusBarHeight + (kToolbarHeight - 36) / 2,
                        height: 36,
                        child: GestureDetector(
                          onTap: () {
                            if (Navigator.of(context).canPop()) {
                              Navigator.of(context).pop();
                            } else if (context.canPop()) {
                              context.pop();
                            } else {
                              context.go(RoutePath.bottomNavbar);
                            }
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                  opacity: expandRatio.clamp(0.0, 1.0),
                                  child: const Text(
                                    'Back',
                                    style: TextStyle(
                                      color: _kAccentRed,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
        
            // BODY CONTENT
            _buildBody(),
          ],
        ),
      ),
    );
  }

  //  Body

  Widget _buildBody() {
    switch (widget.params.type) {
      case GridMoviesType.trending:
        return BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
          bloc: _trendingBloc,
          builder: (context, state) {
            return state.when(
              initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              loading: () => _buildLoadingGrid(),
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
          bloc: _topRatedBloc,
          builder: (context, state) {
            return state.when(
              initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              loading: () => _buildLoadingGrid(),
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
          bloc: _similarBloc,
          builder: (context, state) {
            return state.when(
              initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              loading: () => _buildLoadingGrid(),
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
          bloc: _recommendationsBloc,
          builder: (context, state) {
            return state.when(
              initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              loading: () => _buildLoadingGrid(),
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

  Widget _buildLoadingGrid() {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => const _GridShimmerItem(),
          childCount: 6,
        ),
      ),
    );
  }

  Widget _buildContentSlivers(
    BuildContext context,
    PagedResullt<Movie> result,
  ) {
    if (result.results.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: _GridEmptyView(),
      );
    }

    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final movie = result.results[index];
              return _MovieGridCard(movie: movie);
            }, childCount: result.results.length),
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
    // Reset the scroll position to the top immediately so the new
    // page's movies (and the loading shimmer) are visible right away,
    // instead of leaving the user scrolled down where the old page was.
    _resetScroll();

    switch (widget.params.type) {
      case GridMoviesType.trending:
        _trendingBloc?.add(
          TrendingMoviesEvent.getTrending(
            lang: 'en-US',
            page: page,
            timeWindow: TimeWindow.week,
          ),
        );
        break;
      case GridMoviesType.topRated:
        _topRatedBloc?.add(
          TopRatedMoviesEvent.getTopRatedMovies(lang: 'en-US', page: page),
        );
        break;
      case GridMoviesType.similar:
        if (widget.params.movieId != null) {
          _similarBloc?.add(
            SimilarMoviesEvent.getSimilarMovies(
              id: widget.params.movieId!,
              lang: 'en-US',
              page: page,
            ),
          );
        }
        break;
      case GridMoviesType.recommendation:
        if (widget.params.movieId != null) {
          _recommendationsBloc?.add(
            MovieRecommendationsEvent.getMoviesRecommendations(
              id: widget.params.movieId!,
              lang: 'en-US',
              page: page,
            ),
          );
        }
        break;
    }
  }

  void _resetScroll() {
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }
}

// Movie Card

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
        onTap: () =>
            context.pushNamed(RouteName.movieDetailsScreen, extra: movie),
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

//  Pagination Chip Widget

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

//  Shimmer & Error & Empty States

class _GridShimmerItem extends StatelessWidget {
  const _GridShimmerItem();

  @override
  Widget build(BuildContext context) {
    return _Shimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: _kShimmerFill,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 12,
            width: double.infinity,
            decoration: BoxDecoration(
              color: _kShimmerFill,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            height: 12,
            width: 80,
            decoration: BoxDecoration(
              color: _kShimmerFill,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
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
      duration: const Duration(milliseconds: 1200),
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
            stops: const [0.2, 0.5, 0.8],
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