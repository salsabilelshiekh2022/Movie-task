import 'movie_model.dart';

class PaginatedMovies {
  final List<MovieModel> movies;
  final int page;
  final int totalPages;
  final int totalResults;

  PaginatedMovies({
    required this.movies,
    required this.page,
    required this.totalPages,
    required this.totalResults,
  });

  factory PaginatedMovies.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List?;
    final movies = results != null
        ? results.map((e) => MovieModel.fromJson(e)).toList()
        : <MovieModel>[];

    return PaginatedMovies(
      movies: movies,
      page: json['page'] ?? 1,
      totalPages: json['total_pages'] ?? 1,
      totalResults: json['total_results'] ?? 0,
    );
  }

  bool get hasMorePages => page < totalPages && page < 2;
}
