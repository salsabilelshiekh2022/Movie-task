import 'package:movie_task/core/helper/number_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/widgets/custom_error_widget.dart';
import '../../../../../core/enums/request_status.dart';
import '../../controller/movies_cubit/movies_cubit.dart';
import 'movie_grid.dart';
import 'movies_search_bar.dart';

class MoviesBody extends StatelessWidget {
  const MoviesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MoviesSearchBar(),
        Expanded(
          child: BlocBuilder<MoviesCubit, MoviesState>(
            builder: (context, state) {
              final isLoading = state.isSearching
                  ? state.searchStatus.isLoading
                  : state.moviesStatus.isLoading;

              final isError = state.isSearching
                  ? state.searchStatus.isError
                  : state.moviesStatus.isError;

              if (isLoading && state.movies.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (isError && state.movies.isEmpty) {
                return CustomErrorWidget(
                  errorMessage: state.errorMessage,
                  ontap: () {
                    if (state.isSearching) {
                      context.read<MoviesCubit>().searchMovies(
                        state.searchQuery,
                      );
                    } else {
                      context.read<MoviesCubit>().getPopularMovies();
                    }
                  },
                );
              }

              if (state.movies.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.movie_outlined,
                        size: 64,
                        color: Colors.grey[400],
                      ),
                      16.verticalSizedBox,
                      Text(
                        state.isSearching
                            ? 'No movies found for "${state.searchQuery}"'
                            : 'No movies found',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }

              return MoviesGrid(
                movies: state.movies,
                hasMorePages: state.hasMorePages,
                isLoadingMore: state.isLoadingMore,
              );
            },
          ),
        ),
      ],
    );
  }
}
