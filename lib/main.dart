import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/blocs/film_bloc.dart';
import 'package:flutter_projects/screens/home_screen.dart';
import 'package:flutter_projects/theme/pp_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: PpColors.green,
      title: 'Ma Bibliothèque de Films',
      home: BlocProvider(
        create: (context) => FilmCubit(),
        child: const HomePage(),
      ),
    );
  }
}
