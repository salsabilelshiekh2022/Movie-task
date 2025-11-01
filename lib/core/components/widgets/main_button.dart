import 'package:movie_task/core/helper/app_extention.dart';
import 'package:movie_task/core/helper/widget_extentions.dart';
import 'package:flutter/material.dart';

import '../../theme/app_text_style.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    required this.onTap,
    this.btnColor,
    this.titleColor,
  });
  final String title;
  final void Function() onTap;
  final Color? btnColor;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    final AppTextStyles appTextStyles = Theme.of(
      context,
    ).extension<AppTextStyles>()!;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: btnColor ?? context.colors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: appTextStyles.font17MediumPrimaryColor.copyWith(
              color: titleColor ?? context.colors.whiteColor,
            ),
          ),
        ),
      ),
    ).allPadding(24);
  }
}
