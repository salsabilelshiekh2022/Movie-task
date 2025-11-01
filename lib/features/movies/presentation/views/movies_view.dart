import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/movies_body.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Popular Movies'),
        centerTitle: true,
      ),
      body: const MoviesBody(),
    );
  }
}
