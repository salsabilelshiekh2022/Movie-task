import 'package:movie_task/core/components/widgets/custom_error_widget.dart';
import 'package:movie_task/core/enums/request_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/movie_model.dart';
import '../controller/movie_details_cubit/movie_details_cubit.dart';
import 'widgets/movie_details/movie_details_body.dart';

class MovieDetailsView extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailsView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state.detailsStatus.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.detailsStatus.isError) {
            return CustomErrorWidget(
              errorMessage: state.errorMessage,
              ontap: () {
                context.read<MovieDetailsCubit>().getMovieDetails(movie.id);
              },
            );
          }
          if (state.movieDetails == null) {
            return const Center(child: Text('No details available'));
          }
          return MovieDetailsBody(
            movieDetails: state.movieDetails!,
            movieId: movie.id,
          );
        },
      ),
    );
  }
}
