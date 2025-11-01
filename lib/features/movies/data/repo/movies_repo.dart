import 'package:dartz/dartz.dart';
import '../../../../core/database/network/failure.dart';
import '../models/movie_details_model.dart';
import '../models/paginated_movies.dart';

abstract class MoviesRepo {
  Future<Either<Failure, PaginatedMovies>> getPopularMovies({int page = 1});
  Future<Either<Failure, PaginatedMovies>> searchMovies({
    required String query,
    int page = 1,
  });
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(int movieId);
}
