import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_state.dart';


import 'package:nex_play/features/shared/widgets/horzontial_movie_list.dart';

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
              title: "Top Rated Movies",
              movies: list,
              hPadding: 15,
              vPadding: 0,
              navTo: () {},
            );
          },
        );
      },
    );
  }
}
