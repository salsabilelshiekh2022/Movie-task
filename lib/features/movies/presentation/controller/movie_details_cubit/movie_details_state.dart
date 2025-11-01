part of 'movie_details_cubit.dart';

class MovieDetailsState extends Equatable {
  final RequestStatus detailsStatus;
  final String? errorMessage;
  final MovieDetailsModel? movieDetails;

  const MovieDetailsState({
    this.detailsStatus = RequestStatus.initial,
    this.errorMessage,
    this.movieDetails,
  });

  MovieDetailsState copyWith({
    RequestStatus? detailsStatus,
    String? errorMessage,
    MovieDetailsModel? movieDetails,
  }) {
    return MovieDetailsState(
      detailsStatus: detailsStatus ?? this.detailsStatus,
      errorMessage: errorMessage,
      movieDetails: movieDetails ?? this.movieDetails,
    );
  }

  @override
  List<Object?> get props => [detailsStatus, errorMessage, movieDetails];
}
