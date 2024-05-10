import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/blocs/film_bloc.dart';
import 'package:flutter_projects/models/film.dart';
import 'package:flutter_projects/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ma Bibliothèque de Films',
      home: BlocProvider(
        create: (context) => FilmBloc(), // Créer le FilmBloc
        child: HomePage(),
      ),
    );
  }
}
