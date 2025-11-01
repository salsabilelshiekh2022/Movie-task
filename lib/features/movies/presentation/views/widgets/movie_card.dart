import 'package:movie_task/core/components/widgets/custom_cache_network_image.dart';
import 'package:movie_task/core/helper/app_extention.dart';
import 'package:movie_task/core/helper/number_extentions.dart';
import 'package:movie_task/core/helper/widget_extentions.dart';
import 'package:flutter/material.dart';
import '../../../../../core/routes/routes.dart';
import '../../../data/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'movie-${movie.id}',
      child: Material(
        child: InkWell(
          onTap: () =>
              context.pushNamed(Routes.movieDetailsView, arguments: movie),
          borderRadius: 12.allBorderRadius,
          child: Container(
            decoration: _buildCardDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_buildPosterImage(), _buildMovieInfo(context)],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      borderRadius: 12.allBorderRadius,
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  Widget _buildPosterImage() {
    return Expanded(
      flex: 3,
      child:
          CustomCachedImageWidget(
            path: movie.fullPosterPath,
            width: double.infinity,
          ).clipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          ),
    );
  }

  Widget _buildMovieInfo(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildMovieTitle(context), _buildMetadataRow()],
        ),
      ),
    );
  }

  Widget _buildMovieTitle(BuildContext context) {
    return Text(
      movie.title,
      style: context.textStyles.font14BoldSecondaryColor,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildMetadataRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          movie.releaseYear,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        _buildRatingBadge(),
      ],
    );
  }

  Widget _buildRatingBadge() {
    return Row(
      children: [
        const Icon(Icons.star, size: 14, color: Colors.amber),
        4.horizontalSizedBox,
        Text(
          movie.voteAverage.toStringAsFixed(1),
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
