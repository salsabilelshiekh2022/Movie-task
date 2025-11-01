import 'package:movie_task/core/helper/number_extentions.dart';
import 'package:movie_task/core/helper/widget_extentions.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/components/widgets/custom_cache_network_image.dart';
import '../../../../data/models/movie_details_model.dart';
import 'movie_details_app_bar.dart';
import 'movie_genres.dart';
import 'poster_and_movie_info.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({
    super.key,
    required this.movieDetails,
    required this.movieId,
  });

  final MovieDetailsModel movieDetails;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MovieDetailsAppBar(
          movieImage: movieDetails.fullBackdropPath.isNotEmpty
              ? movieDetails.fullBackdropPath
              : movieDetails.fullPosterPath,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'movie-$movieId',
                      child: CustomCachedImageWidget(
                        path: movieDetails.fullPosterPath,
                        width: 120,
                        height: 180,
                      ).clipRRect(borderRadius: 12.allBorderRadius),
                    ),
                    16.horizontalSizedBox,

                    PosterAndMovieInfo(movieDetails: movieDetails),
                  ],
                ),

                24.verticalSizedBox,

                if (movieDetails.tagline != null &&
                    movieDetails.tagline!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      '"${movieDetails.tagline}"',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),

                if (movieDetails.genres.isNotEmpty) ...[
                  MovieGenres(movieDetails: movieDetails),
                ],

                const Text(
                  'Overview',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  movieDetails.overview ?? 'No overview available',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
                24.verticalSizedBox,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
