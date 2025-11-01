import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';

  // Endpoints
  static const String popularMovies = '/movie/popular';
  static const String searchMovies = '/search/movie';
  static String movieDetails(int id) => '/movie/$id';
}
