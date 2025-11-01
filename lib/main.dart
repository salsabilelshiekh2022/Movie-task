import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:requests_inspector/requests_inspector.dart';
import 'app/movie_task_app.dart';
import 'core/utils/app_keys.dart';
import 'core/utils/service_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServicesInit.init();
  runApp(
    EasyLocalization(
      supportedLocales: [const Locale('ar'), const Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: RequestsInspector(
        hideInspectorBanner: true,
        navigatorKey: AppKeys.navigatorKey,
        enabled: true,
        child: const MovieTaskApp(),
      ),
    ),
  );
}
