import 'package:movie_task/core/helper/number_extentions.dart';
import 'package:movie_task/core/helper/widget_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/movie_model.dart';
import '../../controller/movies_cubit/movies_cubit.dart';
import 'movie_card.dart';

class MoviesGrid extends StatefulWidget {
  final List<MovieModel> movies;
  final bool hasMorePages;
  final bool isLoadingMore;

  const MoviesGrid({
    super.key,
    required this.movies,
    required this.hasMorePages,
    required this.isLoadingMore,
  });

  @override
  State<MoviesGrid> createState() => _MoviesGridState();
}

class _MoviesGridState extends State<MoviesGrid> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      context.read<MoviesCubit>().loadMoreMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<MoviesCubit>().refreshMovies();
      },
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              controller: _scrollController,
              padding: 16.allPadding,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: widget.movies.length,
              itemBuilder: (context, index) {
                return MovieCard(movie: widget.movies[index]);
              },
            ),
          ),
          if (widget.hasMorePages && widget.isLoadingMore)
            const Center(child: CircularProgressIndicator()).allPadding(16),
        ],
      ),
    );
  }
}
