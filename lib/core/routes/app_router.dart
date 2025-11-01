import 'package:movie_task/features/movies/presentation/views/movie_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/movies/data/models/movie_model.dart';
import '../../features/movies/data/repo/movies_repo.dart';
import '../../features/movies/presentation/controller/movie_details_cubit/movie_details_cubit.dart';
import '../../features/movies/presentation/controller/movies_cubit/movies_cubit.dart';
import '../../features/movies/presentation/views/movies_view.dart';
import '../../features/splash/presentations/views/splash_view.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.moviesView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                MoviesCubit(getIt<MoviesRepo>())..getPopularMovies(),
            child: const MoviesView(),
          ),
        );
      case Routes.movieDetailsView:
        final movie = settings.arguments as MovieModel;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                MovieDetailsCubit(getIt<MoviesRepo>())
                  ..getMovieDetails(movie.id),
            child: MovieDetailsView(movie: movie),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }
}
