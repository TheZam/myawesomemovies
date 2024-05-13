import 'package:flutter_projects/data/dao/films_dao.dart';
import 'package:flutter_projects/db/database.dart';

class FilmService {
  final FilmsDao filmsDao;

  FilmService({required this.filmsDao});

  Future<List<FilmData>> getFilms() {
    return filmsDao.fetchFilms();
  }

  Future<int> addFilm(FilmCompanion film) {
    return filmsDao.addFilm(film);
  }

  Future<int> deleteFilm(int filmId) {
    return filmsDao.deleteOne(filmId);
  }

  void deleteAll() {
    filmsDao.deleteAll();
  }
}