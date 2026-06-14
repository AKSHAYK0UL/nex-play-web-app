import 'package:dio/dio.dart';
import 'package:nex_play/core/constants/api_const.dart';
import 'package:nex_play/core/enums/time_window.dart';
import 'package:nex_play/core/paged_result/paged.dart';
import 'package:nex_play/features/movie/data/models/movie.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api_service.g.dart';

@RestApi()
abstract class MovieApiService {
  factory MovieApiService(Dio dio, {String? baseUrl}) = _MovieApiService;

  @GET(MovieApi.movieDetails)
  Future<Movie> getMovieDetails(
    @Query('id') int id,
    @Query('lang') String lang,
  );

  @GET(MovieApi.nowPlaying)
  Future<Paged<Movie>> getNowPlaying(
    @Query('lang') String lang,
    @Query('page') int page,
  );

  @GET(MovieApi.trending)
  Future<Paged<Movie>> getTrending(
    @Query('lang') String lang,
    @Query('time') TimeWindow time,
    @Query('page') int page,
  );

  @GET(MovieApi.upcoming)
  Future<Paged<Movie>> getUpcoming(
    @Query('lang') String lang,
    @Query('page') int page,
  );

@GET(MovieApi.popular)
  Future<Paged<Movie>> getPopular(
    @Query('lang') String lang,
    @Query('page') int page,
  );

@GET(MovieApi.topRated)
  Future<Paged<Movie>> getTopRated(
    @Query('lang') String lang,
    @Query('page') int page,
  );

@GET(MovieApi.similar)
  Future<Paged<Movie>> getSimilar(
    @Query('id') int id,
    @Query('lang') String lang,
    @Query('page') int page,
  );


@GET(MovieApi.recommendations)
  Future<Paged<Movie>> getRecommendations(
    @Query('id') int id,
    @Query('lang') String lang,
    @Query('page') int page,
  );
}
