import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/network/api_consumer.dart';
import '../../../../core/database/network/end_points.dart';
import '../../../../core/database/network/failure.dart';
import '../models/movie_details_model.dart';
import '../models/paginated_movies.dart';
import 'movies_repo.dart';

@LazySingleton(as: MoviesRepo)
class MoviesRepoImpl implements MoviesRepo {
  final ApiConsumer apiConsumer;

  MoviesRepoImpl(this.apiConsumer);

  @override
  Future<Either<Failure, PaginatedMovies>> getPopularMovies({int page = 1}) {
    if (page > 2) {
      return Future.value(
        Right(
          PaginatedMovies(
            movies: [],
            page: page,
            totalPages: 2,
            totalResults: 0,
          ),
        ),
      );
    }

    return apiConsumer.handleRequest(
      request: () => apiConsumer.get(
        EndPoints.popularMovies,
        queryParameters: {'api_key': EndPoints.apiKey, 'page': page},
      ),
      onSuccess: (result) {
        return PaginatedMovies.fromJson(result);
      },
    );
  }

  @override
  Future<Either<Failure, PaginatedMovies>> searchMovies({
    required String query,
    int page = 1,
  }) {
    return apiConsumer.handleRequest(
      request: () => apiConsumer.get(
        EndPoints.searchMovies,
        queryParameters: {
          'api_key': EndPoints.apiKey,
          'query': query,
          'page': page,
        },
      ),
      onSuccess: (result) {
        return PaginatedMovies.fromJson(result);
      },
    );
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(int movieId) {
    return apiConsumer.handleRequest(
      request: () => apiConsumer.get(
        EndPoints.movieDetails(movieId),
        queryParameters: {'api_key': EndPoints.apiKey},
      ),
      onSuccess: (result) {
        return MovieDetailsModel.fromJson(result);
      },
    );
  }
}
