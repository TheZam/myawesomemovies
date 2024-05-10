import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/models/film.dart';

class FilmBloc extends Cubit<List<Film>> {
  FilmBloc()
      : super(
            _initialFilms); // Initialisez le FilmBloc avec la trilogie du Seigneur des Anneaux

  static final List<Film> _initialFilms = [
    Film(
      titre: 'Le Seigneur des Anneaux : La Communauté de l\'Anneau',
      description:
          'Frodo et ses amis entreprennent un dangereux voyage pour détruire un anneau magique.',
      notation: 5,
      imageUrl: 'assets/images/1.jpg',
    ),
    Film(
        titre: 'Le Seigneur des Anneaux : Les Deux Tours',
        description:
            'Frodo et ses compagnons se séparent pour affronter de nouvelles épreuves dans leur quête.',
        notation: 5,
        imageUrl: 'assets/images/2.jpg'),
    Film(
        titre: 'Le Seigneur des Anneaux : Le Retour du Roi',
        description:
            'La bataille finale contre Sauron se prépare tandis que Frodo tente de détruire l\'anneau.',
        notation: 5,
        imageUrl: 'assets/images/3.jpg'),
  ];

  void addFilm(Film film) {
    List<Film> nouveauxFilms = List.from(state)..add(film);
    emit(nouveauxFilms);
  }

  void deleteFilm(Film film) {
    List<Film> updatedFilms = List.from(state)..remove(film);
    emit(updatedFilms);
  }
}
