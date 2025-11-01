import 'package:movie_task/core/helper/app_extention.dart';
import 'package:movie_task/core/helper/number_extentions.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/movie_details_model.dart';

class PosterAndMovieInfo extends StatelessWidget {
  const PosterAndMovieInfo({super.key, required this.movieDetails});

  final MovieDetailsModel movieDetails;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movieDetails.title,
            style: context.textStyles.font24BoldSecondaryColor,
          ),
          8.verticalSizedBox,
          _buildInfoRow(
            context,
            title: movieDetails.formattedReleaseDate,
            icon: Icons.calendar_today,
          ),
          8.verticalSizedBox,
          if (movieDetails.runtime != null)
            _buildInfoRow(
              context,
              title: movieDetails.runtimeFormatted,
              icon: Icons.access_time,
            ),
          if (movieDetails.runtime != null) 8.verticalSizedBox,
          _buildRating(context),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required String title,
    required IconData icon,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        4.horizontalSizedBox,
        Text(title, style: context.textStyles.font14RegularGrayColor),
      ],
    );
  }

  Widget _buildRating(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, size: 20, color: Colors.amber),
        4.horizontalSizedBox,
        Text(
          movieDetails.voteAverage.toStringAsFixed(1),
          style: context.textStyles.font16BoldSecondaryColor,
        ),
        Text(
          ' (${movieDetails.voteCount} votes)',
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
      ],
    );
  }
}
