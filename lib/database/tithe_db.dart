import 'package:moor_flutter/moor_flutter.dart';
part 'tithe_db.g.dart';


TitheDb _instance;
TitheDb get database {
  return _instance ??= TitheDb();
}


class Dbones extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get benefit => text().nullable()(); // daily water
  RealColumn get value => real().nullable()(); // $80.00
  RealColumn get time => real().nullable()(); // monthly --> 12.0
  RealColumn get totalValue => real().nullable()(); // (12 x 80 = $960/year)
}

class Dbtwos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get benefit => text().nullable()(); // disneyland
  RealColumn get value => real().nullable()(); // $110.00
}

class Dbonessamples extends Table {
  TextColumn get benefits => text().nullable()();
}

class Dbtwossamples extends Table {
  TextColumn get benefits => text().nullable()();
}

@UseMoor(tables: [
  Dbones,
  Dbtwos,
  Dbonessamples,
  Dbtwossamples,
], daos: [
  DboneDao,
  DbtwoDao,
])
class TitheDb extends _$TitheDb {
  TitheDb() : super((FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite')));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) {
        return m.createAll();
      }, beforeOpen: (details) async {
        if (details.wasCreated) {
          await into(dbones).insert(DbonesCompanion(
            benefit: Value("Housing Equity"),
            value: Value(1247.00),
            time: Value(12.0),
            totalValue: Value(14964.00),
          ));
          await into(dbones).insert(DbonesCompanion(
            benefit: Value("Cable Internet"),
            value: Value(75.00),
            time: Value(12.0),
            totalValue: Value(900.00),
          ));
          await into(dbones).insert(DbonesCompanion(
            benefit: Value("Water Usage"),
            value: Value(15.00),
            time: Value(52.0),
            totalValue: Value(780.00),
          ));
          await into(dbones).insert(DbonesCompanion(
            benefit: Value("Food Consumption"),
            value: Value(210.00),
            time: Value(26.0),
            totalValue: Value(5460.00),
          ));
          await into(dbones).insert(DbonesCompanion(
            benefit: Value("Air To Breath"),
            value: Value(6.00),
            time: Value(365.0),
            totalValue: Value(2190.00),
          ));
          await into(dbones).insert(DbonesCompanion(
            benefit: Value("Transportation"),
            value: Value(18.00),
            time: Value(365.0),
            totalValue: Value(6570.00),
          ));

          await into(dbtwos).insert(DbtwosCompanion(
            benefit: Value("Pants and Shirts"),
            value: Value(128.56),
          ));
          await into(dbtwos).insert(DbtwosCompanion(
            benefit: Value("Food Storage Purchase"),
            value: Value(42.81),
          ));
          await into(dbtwos).insert(DbtwosCompanion(
            benefit: Value("Disneyland Ticket"),
            value: Value(110.00),
          ));
          await into(dbtwos).insert(DbtwosCompanion(
            benefit: Value("Golf Clubs"),
            value: Value(482.29),
          ));

          await customStatement('PRAGMA foreign_keys = ON');
        }
      });
}

//-----------------MEMBER DAOs----------------------------------------------------------------------------

@UseDao(tables: [Dbones])
class DboneDao extends DatabaseAccessor<TitheDb> with _$DboneDaoMixin {
  final TitheDb db;

  DboneDao(this.db) : super(db);
  Future<List<Dbone>> getAllDbones() => select(dbones).get();
  Stream<List<Dbone>> watchAllDbones() => select(dbones).watch();
  Future insertDbone(Insertable<Dbone> dbone) => into(dbones).insert(dbone);
  Future updateDbone(Insertable<Dbone> dbone) => update(dbones).replace(dbone);
  Future deleteDbone(Insertable<Dbone> dbone) => delete(dbones).delete(dbone);
  Stream<Dbone> watchDbone(int id) {
    return (select(dbones)..where((t) => t.id.equals(id))).watchSingle();
  }
  Stream<double> sumValues() {
    final avgLength = dbones.totalValue.sum();
    final query = selectOnly(dbones)..addColumns([avgLength]);
    return query.map((row) => row.read(avgLength)).watchSingle();
  }
  Future<Dbone> getDbone(int id) {
    return (select(dbones)..where((t) => t.id.equals(id))).getSingle();
  }
}

@UseDao(tables: [Dbtwos])
class DbtwoDao extends DatabaseAccessor<TitheDb> with _$DbtwoDaoMixin {
  final TitheDb db;

  DbtwoDao(this.db) : super(db);
  Future<List<Dbtwo>> getAllDbtwos() => select(dbtwos).get();
  Stream<List<Dbtwo>> watchAllDbtwos() => select(dbtwos).watch();
  Future insertDbtwo(Insertable<Dbtwo> dbtwo) => into(dbtwos).insert(dbtwo);
  Future updateDbtwo(Insertable<Dbtwo> dbtwo) => update(dbtwos).replace(dbtwo);
  Future deleteDbtwo(Insertable<Dbtwo> dbtwo) => delete(dbtwos).delete(dbtwo);
  Stream<Dbtwo> watchDbtwo(int id) {
    return (select(dbtwos)..where((t) => t.id.equals(id))).watchSingle();
  }
  Stream<double> sumerValues() {
    final avgLength = dbtwos.value.sum();
    final query = selectOnly(dbtwos)..addColumns([avgLength]);
    return query.map((row) => row.read(avgLength)).watchSingle();
  }
  Future<Dbtwo> getDbtwo(int id) {
    return (select(dbtwos)..where((t) => t.id.equals(id))).getSingle();
  }
}
