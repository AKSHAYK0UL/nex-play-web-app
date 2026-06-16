
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nex_play/features/movie/presentation/bloc/movie_detailed_bloc/movie_detailed_event.dart';
import 'package:nex_play/features/movie/presentation/bloc/movie_detailed_bloc/movie_detailed_state.dart';

class MovieDetailedBloc extends Bloc<MovieDetailedEvent, MovieDetailedState> {
  MovieDetailedBloc() : super(const MovieDetailedState.initial());
}