import 'package:dio/dio.dart';
import 'package:nex_play/core/constants/api_const.dart';
import 'package:nex_play/core/models/api_response.dart';
import 'package:nex_play/core/paged_result/paged.dart';
import 'package:nex_play/features/shared/movie/data/models/movie.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api_service.g.dart';

@RestApi()
abstract class MovieApiService {
  factory MovieApiService(Dio dio, {String? baseUrl}) = _MovieApiService;

  @GET(MediaAPI.movieDetails)
  Future<ApiResponse<Movie>> getMovieDetails(
    @Query('id') int id,
    @Query('lang') String lang,
  );

  @GET(MediaAPI.nowPlaying)
  Future<Paged<Movie>> getNowPlaying(
    @Query('lang') String lang,
    @Query('page') int page,
  );

  @GET(MediaAPI.trending)
  Future<Paged<Movie>> getTrending(
    @Query('lang') String lang,
    @Query('time') String time,
    @Query('page') int page,
  );

  @GET(MediaAPI.upcoming)
  Future<Paged<Movie>> getUpcoming(
    @Query('lang') String lang,
    @Query('page') int page,
  );

@GET(MediaAPI.popular)
  Future<Paged<Movie>> getPopular(
    @Query('lang') String lang,
    @Query('page') int page,
  );

@GET(MediaAPI.topRated)
  Future<Paged<Movie>> getTopRated(
    @Query('lang') String lang,
    @Query('page') int page,
  );

@GET(MediaAPI.similar)
  Future<Paged<Movie>> getSimilar(
    @Query('id') int id,
    @Query('lang') String lang,
    @Query('page') int page,
  );


@GET(MediaAPI.recommendations)
  Future<Paged<Movie>> getRecommendations(
    @Query('id') int id,
    @Query('lang') String lang,
    @Query('page') int page,
  );
}
