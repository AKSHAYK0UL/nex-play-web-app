import 'package:dio/dio.dart';
import 'package:nex_play/core/enums/time_window.dart';
import 'package:nex_play/core/errors/exceptions.dart';
import 'package:nex_play/core/paged_result/paged.dart';
import 'package:nex_play/core/utils/logger.dart';
import 'package:nex_play/features/movie/data/models/movie.dart';
import 'package:nex_play/features/movie/data/remote/movie_api_service.dart';

abstract interface class MovieRemoteDatasource {
  Future<Movie> getMovieDetails({required int id, required String lang});

  Future<Paged<Movie>> getNowPlaying({required String lang, required int page});

  Future<Paged<Movie>> getTrending({
    required String lang,
    required TimeWindow time,
    required int page,
  });

  Future<Paged<Movie>> getUpcoming({required String lang, required int page});

  Future<Paged<Movie>> getPopular({required String lang, required int page});

  Future<Paged<Movie>> getTopRated({required String lang, required int page});

  Future<Paged<Movie>> getSimilar({
    required int id,
    required String lang,
    required int page,
  });

  Future<Paged<Movie>> getRecommendations({
    required int id,
    required String lang,
    required int page,
  });
}

//impl
class MovieRemoteDatasourceImpl implements MovieRemoteDatasource {
  final MovieApiService _movieApiService;
  MovieRemoteDatasourceImpl(this._movieApiService);

  @override
  Future<Movie> getMovieDetails({required int id, required String lang}) async {
    try {
      AppLogger.info("Attempting Fetch getMovieDetails: $id");

      final response = await _movieApiService.getMovieDetails(id, lang);

      AppLogger.info("Movie response ${response.data.title}");
      return response.data;
    } on DioException catch (e) {
      AppLogger.error("Failed to Fetch MovieDetails: $id");
      _handleDioError(e);
    }
  }

  @override
  Future<Paged<Movie>> getNowPlaying({
    required String lang,
    required int page,
  }) async {
    try {
      AppLogger.info("Attempting Fetch getNowPlaying");

      final response = await _movieApiService.getNowPlaying(lang, page);

      AppLogger.info(
        "NowPlaying totalResults response ${response.totalResults}",
      );
      return response;
    } on DioException catch (e) {
      AppLogger.error("Failed to Fetch getNowPlaying");
      _handleDioError(e);
    }
  }

  @override
  Future<Paged<Movie>> getPopular({
    required String lang,
    required int page,
  }) async {
    try {
      AppLogger.info("Attempting Fetch getPopular");

      final response = await _movieApiService.getPopular(lang, page);

      AppLogger.info("Popular movies response ${response.totalResults}");
      return response;
    } on DioException catch (e) {
      AppLogger.error("Failed to Fetch Popular movies");
      _handleDioError(e);
    }
  }

  @override
  Future<Paged<Movie>> getRecommendations({
    required int id,
    required String lang,
    required int page,
  }) async {
    try {
      AppLogger.info("Attempting Fetch getRecommendations: $id");

      final response = await _movieApiService.getRecommendations(
        id,
        lang,
        page,
      );

      AppLogger.info(
        "Recommendations movies response ${response.totalResults}",
      );
      return response;
    } on DioException catch (e) {
      AppLogger.error("Failed to Fetch Recommendations movies");
      _handleDioError(e);
    }
  }

  @override
  Future<Paged<Movie>> getSimilar({
    required int id,
    required String lang,
    required int page,
  }) async {
    try {
      AppLogger.info("Attempting Fetch getSimilar: $id");

      final response = await _movieApiService.getSimilar(id, lang, page);

      AppLogger.info("Similar movies response ${response.totalResults}");
      return response;
    } on DioException catch (e) {
      AppLogger.error("Failed to Fetch Similar movies");
      _handleDioError(e);
    }
  }

  @override
  Future<Paged<Movie>> getTopRated({
    required String lang,
    required int page,
  }) async {
    try {
      AppLogger.info("Attempting Fetch getTopRated");

      final response = await _movieApiService.getTopRated(lang, page);

      AppLogger.info("TopRated movies response ${response.totalResults}");
      return response;
    } on DioException catch (e) {
      AppLogger.error("Failed to Fetch TopRated movies");
      _handleDioError(e);
    }
  }

  @override
  Future<Paged<Movie>> getTrending({
    required String lang,
    required TimeWindow time,
    required int page,
  }) async {
    try {
      AppLogger.info("Attempting Fetch getTrending");

      final response = await _movieApiService.getTrending(lang, time, page);

      AppLogger.info("Trending movies response ${response.totalResults}");
      return response;
    } on DioException catch (e) {
      AppLogger.error("Faied to Fetch Trending movies");
      _handleDioError(e);
    }
  }

  @override
  Future<Paged<Movie>> getUpcoming({
    required String lang,
    required int page,
  }) async {
    try {
      AppLogger.info("Attempting Fetch getUpcoming");

      final response = await _movieApiService.getUpcoming(lang, page);

      AppLogger.info("Upcoming movies response ${response.totalResults}");
      return response;
    } on DioException catch (e) {
      AppLogger.error("Faied to Fetch Upcoming movies");
      _handleDioError(e);
    }
  }
}

//error handler
Never _handleDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
      throw const NetworkException('No internet or connection timed out.');
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      throw ServerException('Server error: $statusCode');
    default:
      throw ServerException(e.message ?? 'An unexpected error occurred.');
  }
}
