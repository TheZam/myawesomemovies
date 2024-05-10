import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/models/film.dart';

class FilmBloc extends Cubit<List<Film>> {
  FilmBloc() : super([]); // Initialisez le FilmBloc sans liste de films

  void ajouterFilm(Film film) {
    List<Film> nouveauxFilms = List.from(state)..add(film);
    emit(nouveauxFilms);
  }
}
