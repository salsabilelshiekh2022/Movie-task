import 'package:movie_task/core/helper/app_extention.dart';
import 'package:flutter/material.dart';

import 'main_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, this.errorMessage, required this.ontap});

  final String? errorMessage;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage ?? 'Error loading movie details',
            style: context.textStyles.font16MediumPrimaryColor.copyWith(
              color: context.colors.redColor,
            ),
            textAlign: TextAlign.center,
          ),
          MainButton(
            title: 'Retry',
            btnColor: context.colors.primaryColor,
            onTap: ontap,
          ),
        ],
      ),
    );
  }
}
