import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/blocs/film_state.dart';
import 'package:flutter_projects/db/database.dart';
import 'package:flutter_projects/services/fim_service.dart';

class FilmCubit extends Cubit<FilmState> {
  final FilmService filmService;
  FilmCubit(this.filmService) : super(FilmState([]));

  void getFilms() {
    filmService.getFilms().then((value) => emit(FilmState(value)));
  }

  void addFilm(FilmData film) async {
    FilmCompanion filmToAdd = FilmCompanion(
      title: Value(film.title),
      description: Value(film.description),
      notation: Value(film.notation),
      image: Value(film.image)
    );

    filmService.addFilm(filmToAdd);
    await filmService.getFilms().then((films) => {
      emit(FilmState(films))
    });
  }

  void deleteAll() async {
    filmService.deleteAll();
  }

  void deleteFilm(int filmId) async {
    await filmService.deleteFilm(filmId);
    await filmService.getFilms().then((films) => {
      emit(FilmState(films))
    });
  }
}
