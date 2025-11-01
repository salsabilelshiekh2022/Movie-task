import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movie_task/core/helper/app_extention.dart';
import 'package:movie_task/generated/app_assets.dart';

import '../../../../core/routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (mounted) {
        context.pushNamedAndRemoveUntil(Routes.moviesView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.whiteColor,
      body: Center(
        child: Image.asset(
          AppAssets.imagesLogo,
          height: 150,
          fit: BoxFit.cover,
        ).animate().fade(duration: 2.seconds, curve: Curves.easeIn),
      ),
    );
  }
}
