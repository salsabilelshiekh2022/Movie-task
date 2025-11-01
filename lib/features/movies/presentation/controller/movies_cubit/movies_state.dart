part of 'movies_cubit.dart';

class MoviesState extends Equatable {
  final RequestStatus moviesStatus;
  final RequestStatus searchStatus;
  final String? errorMessage;
  final List<MovieModel> movies;
  final int currentPage;
  final int totalPages;
  final bool hasMorePages;
  final bool isLoadingMore;
  final bool isRefreshing;
  final bool isSearching;
  final String searchQuery;

  const MoviesState({
    this.moviesStatus = RequestStatus.initial,
    this.searchStatus = RequestStatus.initial,
    this.errorMessage,
    this.movies = const [],
    this.currentPage = 0,
    this.totalPages = 1,
    this.hasMorePages = true,
    this.isLoadingMore = false,
    this.isRefreshing = false,
    this.isSearching = false,
    this.searchQuery = '',
  });

  MoviesState copyWith({
    RequestStatus? moviesStatus,
    RequestStatus? searchStatus,
    String? errorMessage,
    List<MovieModel>? movies,
    int? currentPage,
    int? totalPages,
    bool? hasMorePages,
    bool? isLoadingMore,
    bool? isRefreshing,
    bool? isSearching,
    String? searchQuery,
  }) {
    return MoviesState(
      moviesStatus: moviesStatus ?? this.moviesStatus,
      searchStatus: searchStatus ?? this.searchStatus,
      errorMessage: errorMessage,
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      hasMorePages: hasMorePages ?? this.hasMorePages,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isSearching: isSearching ?? this.isSearching,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [
    moviesStatus,
    searchStatus,
    errorMessage,
    movies,
    currentPage,
    totalPages,
    hasMorePages,
    isLoadingMore,
    isRefreshing,
    isSearching,
    searchQuery,
  ];
}
