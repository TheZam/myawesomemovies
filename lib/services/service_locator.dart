import 'package:flutter_projects/data/dao/films_dao.dart';
import 'package:flutter_projects/db/database.dart';
import 'package:flutter_projects/services/fim_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<FilmsDao>(FilmsDao(AppDatabase()));
  getIt.registerSingleton<FilmService>(FilmService(filmsDao: getIt<FilmsDao>()));
}
