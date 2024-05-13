// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FilmTable extends Film with TableInfo<$FilmTable, FilmData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FilmTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _notationMeta =
      const VerificationMeta('notation');
  @override
  late final GeneratedColumn<int> notation = GeneratedColumn<int>(
      'notation', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<Uint8List> image = GeneratedColumn<Uint8List>(
      'image', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, notation, title, description, image];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'film';
  @override
  VerificationContext validateIntegrity(Insertable<FilmData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('notation')) {
      context.handle(_notationMeta,
          notation.isAcceptableOrUnknown(data['notation']!, _notationMeta));
    } else if (isInserting) {
      context.missing(_notationMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FilmData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FilmData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      notation: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}notation'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image']),
    );
  }

  @override
  $FilmTable createAlias(String alias) {
    return $FilmTable(attachedDatabase, alias);
  }
}

class FilmData extends DataClass implements Insertable<FilmData> {
  final int id;
  final int notation;
  final String title;
  final String description;
  final Uint8List? image;
  const FilmData(
      {required this.id,
      required this.notation,
      required this.title,
      required this.description,
      this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['notation'] = Variable<int>(notation);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<Uint8List>(image);
    }
    return map;
  }

  FilmCompanion toCompanion(bool nullToAbsent) {
    return FilmCompanion(
      id: Value(id),
      notation: Value(notation),
      title: Value(title),
      description: Value(description),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory FilmData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FilmData(
      id: serializer.fromJson<int>(json['id']),
      notation: serializer.fromJson<int>(json['notation']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      image: serializer.fromJson<Uint8List?>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'notation': serializer.toJson<int>(notation),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<Uint8List?>(image),
    };
  }

  FilmData copyWith(
          {int? id,
          int? notation,
          String? title,
          String? description,
          Value<Uint8List?> image = const Value.absent()}) =>
      FilmData(
        id: id ?? this.id,
        notation: notation ?? this.notation,
        title: title ?? this.title,
        description: description ?? this.description,
        image: image.present ? image.value : this.image,
      );
  @override
  String toString() {
    return (StringBuffer('FilmData(')
          ..write('id: $id, ')
          ..write('notation: $notation, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, notation, title, description, $driftBlobEquality.hash(image));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FilmData &&
          other.id == this.id &&
          other.notation == this.notation &&
          other.title == this.title &&
          other.description == this.description &&
          $driftBlobEquality.equals(other.image, this.image));
}

class FilmCompanion extends UpdateCompanion<FilmData> {
  final Value<int> id;
  final Value<int> notation;
  final Value<String> title;
  final Value<String> description;
  final Value<Uint8List?> image;
  const FilmCompanion({
    this.id = const Value.absent(),
    this.notation = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
  });
  FilmCompanion.insert({
    this.id = const Value.absent(),
    required int notation,
    required String title,
    required String description,
    this.image = const Value.absent(),
  })  : notation = Value(notation),
        title = Value(title),
        description = Value(description);
  static Insertable<FilmData> custom({
    Expression<int>? id,
    Expression<int>? notation,
    Expression<String>? title,
    Expression<String>? description,
    Expression<Uint8List>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (notation != null) 'notation': notation,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
    });
  }

  FilmCompanion copyWith(
      {Value<int>? id,
      Value<int>? notation,
      Value<String>? title,
      Value<String>? description,
      Value<Uint8List?>? image}) {
    return FilmCompanion(
      id: id ?? this.id,
      notation: notation ?? this.notation,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (notation.present) {
      map['notation'] = Variable<int>(notation.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<Uint8List>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FilmCompanion(')
          ..write('id: $id, ')
          ..write('notation: $notation, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $FilmTable film = $FilmTable(this);
  late final FilmsDao filmsDao = FilmsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [film];
}

typedef $$FilmTableInsertCompanionBuilder = FilmCompanion Function({
  Value<int> id,
  required int notation,
  required String title,
  required String description,
  Value<Uint8List?> image,
});
typedef $$FilmTableUpdateCompanionBuilder = FilmCompanion Function({
  Value<int> id,
  Value<int> notation,
  Value<String> title,
  Value<String> description,
  Value<Uint8List?> image,
});

class $$FilmTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FilmTable,
    FilmData,
    $$FilmTableFilterComposer,
    $$FilmTableOrderingComposer,
    $$FilmTableProcessedTableManager,
    $$FilmTableInsertCompanionBuilder,
    $$FilmTableUpdateCompanionBuilder> {
  $$FilmTableTableManager(_$AppDatabase db, $FilmTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FilmTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FilmTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$FilmTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> notation = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<Uint8List?> image = const Value.absent(),
          }) =>
              FilmCompanion(
            id: id,
            notation: notation,
            title: title,
            description: description,
            image: image,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int notation,
            required String title,
            required String description,
            Value<Uint8List?> image = const Value.absent(),
          }) =>
              FilmCompanion.insert(
            id: id,
            notation: notation,
            title: title,
            description: description,
            image: image,
          ),
        ));
}

class $$FilmTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $FilmTable,
    FilmData,
    $$FilmTableFilterComposer,
    $$FilmTableOrderingComposer,
    $$FilmTableProcessedTableManager,
    $$FilmTableInsertCompanionBuilder,
    $$FilmTableUpdateCompanionBuilder> {
  $$FilmTableProcessedTableManager(super.$state);
}

class $$FilmTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FilmTable> {
  $$FilmTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get notation => $state.composableBuilder(
      column: $state.table.notation,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FilmTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FilmTable> {
  $$FilmTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get notation => $state.composableBuilder(
      column: $state.table.notation,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$FilmTableTableManager get film => $$FilmTableTableManager(_db, _db.film);
}
