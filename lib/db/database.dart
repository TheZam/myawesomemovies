import 'package:drift/drift.dart';
import 'package:flutter_projects/data/dao/films_dao.dart';
import 'package:flutter_projects/data/models/film.dart';
import 'package:flutter_projects/db/connection.dart' as impl;

part 'database.g.dart';

@DriftDatabase(tables: [Film], daos: [FilmsDao])
class AppDatabase extends _$AppDatabase {

  AppDatabase() : super(impl.connect());

  @override
  int get schemaVersion => 1;
}