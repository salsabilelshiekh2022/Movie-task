import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/enums/request_status.dart';
import '../../../data/models/movie_details_model.dart';
import '../../../data/repo/movies_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.moviesRepo) : super(const MovieDetailsState());

  final MoviesRepo moviesRepo;

  Future<void> getMovieDetails(int movieId) async {
    emit(state.copyWith(detailsStatus: RequestStatus.loading));

    final result = await moviesRepo.getMovieDetails(movieId);

    result.fold(
      (failure) => emit(
        state.copyWith(
          detailsStatus: RequestStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (movieDetails) => emit(
        state.copyWith(
          detailsStatus: RequestStatus.success,
          movieDetails: movieDetails,
        ),
      ),
    );
  }
}
