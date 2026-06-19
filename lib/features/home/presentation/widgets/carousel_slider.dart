import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error) => Center(child: Text(error)),
          success: (movies) {
            final list = movies.results.take(20).toList();

            return CarouselSlider.builder(
              itemCount: list.length,
              itemBuilder: (context, index, _) {
                return _CarouselCard(movie: list[index]);
              },
              options: CarouselOptions(
                autoPlay: true,
                pauseAutoPlayOnTouch: true,
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: true,
                disableCenter: true,
                height: MediaQuery.of(context).size.height * 0.66,
              ),
            );
          },
        );
      },
    );
  }
}

class _CarouselCard extends StatelessWidget {
  final Movie movie;
  const _CarouselCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            "https://image.tmdb.org/t/p/original/${movie.posterPath}",
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                const Center(child: Icon(Icons.broken_image)),
          ),
        ),
      ),
    );
  }
}
