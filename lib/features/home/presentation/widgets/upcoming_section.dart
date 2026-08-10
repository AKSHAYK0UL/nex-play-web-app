import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nex_play/features/shared/movie/presentation/bloc/upcoming_movies_bloc/upcoming_movies_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/upcoming_movies_bloc/upcoming_movies_state.dart';
import 'package:nex_play/features/shared/widgets/horzontial_movie_list.dart';

class BuildUpcomingMoviesList extends StatelessWidget {
  const BuildUpcomingMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
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
              title: "Upcoming Movies",
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
