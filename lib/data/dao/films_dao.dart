import 'package:drift/drift.dart';
import 'package:flutter_projects/data/models/film.dart';
import 'package:flutter_projects/db/database.dart';

part 'films_dao.g.dart';

@DriftAccessor(tables: [Film])
class FilmsDao extends DatabaseAccessor<AppDatabase> with _$FilmsDaoMixin {
  FilmsDao(super.db);

 Future<List<FilmData>> fetchFilms() async {
   return select(film).get();
 }

  Future<int> addFilm(FilmCompanion data) {
    return into(film).insert(data);
  }

  Future<int> deleteOne(int filmId) {
   return (delete(film)..where((tbl) => tbl.id.equals(filmId))).go();
  }

  void deleteAll() {
    delete(film).go();
  }
}
