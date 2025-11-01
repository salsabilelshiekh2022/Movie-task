import 'package:flutter/material.dart';
import 'package:movie_task/core/helper/number_extentions.dart';

import '../../theme/app_text_style.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });
  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final appTextStyles = Theme.of(context).extension<AppTextStyles>()!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: double.infinity,
          height: 224.0,
          fit: BoxFit.cover,
        ),
        16.verticalSizedBox,
        Text(title, style: appTextStyles.font16MediumSecondaryColor),
        6.verticalSizedBox,
        Text(
          description,
          style: appTextStyles.font14MediumSecondaryColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
