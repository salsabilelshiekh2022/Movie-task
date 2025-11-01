import 'package:movie_task/core/helper/app_extention.dart';
import 'package:movie_task/core/helper/number_extentions.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/movie_details_model.dart';

class MovieGenres extends StatelessWidget {
  const MovieGenres({super.key, required this.movieDetails});

  final MovieDetailsModel movieDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Genres', style: context.textStyles.font18BoldSecondaryColor),
        8.verticalSizedBox,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: movieDetails.genres.map((genre) {
            return Chip(
              label: Text(genre.name),
              backgroundColor: Theme.of(
                context,
              ).primaryColor.withValues(alpha: 0.1),
              labelStyle: TextStyle(color: context.colors.primaryColor),
            );
          }).toList(),
        ),
        24.verticalSizedBox,
      ],
    );
  }
}
