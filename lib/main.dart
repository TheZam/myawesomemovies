import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/screens/home_screen.dart';
import 'package:flutter_projects/services/fim_service.dart';
import 'package:flutter_projects/services/service_locator.dart';
import 'package:flutter_projects/theme/pp_colors.dart';
import 'blocs/film_cubit.dart';

void main() async {
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: PpColors.green,
        title: 'Ma Bibliothèque de Films',
        home: BlocProvider(
          create: (_) => FilmCubit(getIt<FilmService>()),
          child: const HomePage(),
        ));
  }
}
