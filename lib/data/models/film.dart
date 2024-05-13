import 'package:drift/drift.dart';

class Film extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get notation => integer()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  BlobColumn get image => blob().nullable()();
}