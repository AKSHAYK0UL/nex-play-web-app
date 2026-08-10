import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_bloc.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_state.dart';
import 'package:nex_play/features/shared/widgets/horzontial_movie_list.dart';

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieRecommendationsBloc, MovieRecommendationsState>(
      buildWhen: (previous, current) => current != previous,
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => HorzontialMovieListLoading(),
          error: (err) => const SizedBox.shrink(),
          success: (movies) {
            final list = movies.results.take(10).toList();
            if (list.isEmpty) return const SizedBox.shrink();
            return HorzontialMovieListContent(
              title: "You Might Like",
              movies: list,
              navTo: () {},
              hPadding: 0,
              vPadding: 0,
            );
          },
        );
      },
    );
  }
}
