import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/enums/request_status.dart';
import '../../../data/models/movie_model.dart';
import '../../../data/repo/movies_repo.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.moviesRepo) : super(const MoviesState());

  final MoviesRepo moviesRepo;

  Future<void> getPopularMovies() async {
    emit(
      state.copyWith(
        moviesStatus: RequestStatus.loading,
        isSearching: false,
        searchQuery: '',
      ),
    );

    final result = await moviesRepo.getPopularMovies(page: 1);

    result.fold(
      (failure) => emit(
        state.copyWith(
          moviesStatus: RequestStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (paginatedData) => emit(
        state.copyWith(
          moviesStatus: RequestStatus.success,
          movies: paginatedData.movies,
          currentPage: paginatedData.page,
          totalPages: paginatedData.totalPages,
          hasMorePages: paginatedData.hasMorePages,
        ),
      ),
    );
  }

  Future<void> loadMoreMovies() async {
    if (!state.hasMorePages || state.isLoadingMore) {
      return;
    }

    if (!state.isSearching && state.currentPage >= 2) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = state.currentPage + 1;

    final result = state.isSearching
        ? await moviesRepo.searchMovies(
            query: state.searchQuery,
            page: nextPage,
          )
        : await moviesRepo.getPopularMovies(page: nextPage);

    result.fold(
      (failure) => emit(
        state.copyWith(isLoadingMore: false, errorMessage: failure.message),
      ),
      (paginatedData) {
        final updatedMovies = [...state.movies, ...paginatedData.movies];

        emit(
          state.copyWith(
            isLoadingMore: false,
            movies: updatedMovies,
            currentPage: paginatedData.page,
            totalPages: paginatedData.totalPages,
            hasMorePages: state.isSearching
                ? paginatedData.hasMorePages
                : (paginatedData.hasMorePages && nextPage < 2),
          ),
        );
      },
    );
  }

  Future<void> refreshMovies() async {
    emit(state.copyWith(isRefreshing: true));

    final result = state.isSearching
        ? await moviesRepo.searchMovies(query: state.searchQuery, page: 1)
        : await moviesRepo.getPopularMovies(page: 1);

    result.fold(
      (failure) => emit(
        state.copyWith(isRefreshing: false, errorMessage: failure.message),
      ),
      (paginatedData) => emit(
        state.copyWith(
          isRefreshing: false,
          moviesStatus: RequestStatus.success,
          movies: paginatedData.movies,
          currentPage: paginatedData.page,
          totalPages: paginatedData.totalPages,
          hasMorePages: state.isSearching
              ? paginatedData.hasMorePages
              : (paginatedData.hasMorePages && paginatedData.page < 2),
        ),
      ),
    );
  }

  Future<void> searchMovies(String query) async {
    if (query.trim().isEmpty) {
      clearSearch();
      return;
    }

    emit(
      state.copyWith(
        searchStatus: RequestStatus.loading,
        isSearching: true,
        searchQuery: query,
      ),
    );

    final result = await moviesRepo.searchMovies(query: query, page: 1);

    result.fold(
      (failure) => emit(
        state.copyWith(
          searchStatus: RequestStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (paginatedData) => emit(
        state.copyWith(
          searchStatus: RequestStatus.success,
          movies: paginatedData.movies,
          currentPage: paginatedData.page,
          totalPages: paginatedData.totalPages,
          hasMorePages: paginatedData.hasMorePages,
        ),
      ),
    );
  }

  void clearSearch() {
    getPopularMovies();
  }
}
