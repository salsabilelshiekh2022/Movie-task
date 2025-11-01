import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/routes/app_router.dart';
import '../core/theme/app_themes.dart';
import '../core/utils/app_constatnts.dart';
import '../core/utils/app_keys.dart';
import '../features/splash/presentations/views/splash_view.dart';

class MovieTaskApp extends StatelessWidget {
  const MovieTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppKeys.navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: AppConstants.appName,
      darkTheme: AppThemes().darkTheme,
      theme: AppThemes().lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      home: const SplashView(),
    );
  }
}
