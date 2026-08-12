import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nex_play/core/enums/grid_movie_type.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_state.dart';
import 'package:nex_play/features/shared/widgets/horzontial_movie_list.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_play/core/router/app_router.dart';
import 'package:nex_play/features/shared/widgets/grid_movies_list.dart';

class BuildTopRatedMoviesList extends StatelessWidget {
  const BuildTopRatedMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const HorzontialMovieListLoading(),
          error: (error) => HorzontialMovieListError(message: error),
          success: (movies) {
            final list = movies.results.take(10).toList();
            if (list.isEmpty) return const SizedBox.shrink();
            return HorzontialMovieListContent(
              title: "Top Rated",
              movies: list,
              hPadding: 15,
              vPadding: 0,
              navTo: () {
                context.pushNamed(
                  RouteName.gridMoviesScreen,
                  extra: const GridMoviesParams(
                    type: GridMoviesType.topRated,
                    title: "Top Rated",
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
