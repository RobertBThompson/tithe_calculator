// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tithe_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Dbone extends DataClass implements Insertable<Dbone> {
  final int id;
  final String benefit;
  final double value;
  final double time;
  final double totalValue;
  Dbone(
      {@required this.id,
      this.benefit,
      this.value,
      this.time,
      this.totalValue});
  factory Dbone.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Dbone(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      benefit:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}benefit']),
      value:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
      time: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}time']),
      totalValue: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_value']),
    );
  }
  factory Dbone.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Dbone(
      id: serializer.fromJson<int>(json['id']),
      benefit: serializer.fromJson<String>(json['benefit']),
      value: serializer.fromJson<double>(json['value']),
      time: serializer.fromJson<double>(json['time']),
      totalValue: serializer.fromJson<double>(json['totalValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'benefit': serializer.toJson<String>(benefit),
      'value': serializer.toJson<double>(value),
      'time': serializer.toJson<double>(time),
      'totalValue': serializer.toJson<double>(totalValue),
    };
  }

  @override
  DbonesCompanion createCompanion(bool nullToAbsent) {
    return DbonesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      benefit: benefit == null && nullToAbsent
          ? const Value.absent()
          : Value(benefit),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      totalValue: totalValue == null && nullToAbsent
          ? const Value.absent()
          : Value(totalValue),
    );
  }

  Dbone copyWith(
          {int id,
          String benefit,
          double value,
          double time,
          double totalValue}) =>
      Dbone(
        id: id ?? this.id,
        benefit: benefit ?? this.benefit,
        value: value ?? this.value,
        time: time ?? this.time,
        totalValue: totalValue ?? this.totalValue,
      );
  @override
  String toString() {
    return (StringBuffer('Dbone(')
          ..write('id: $id, ')
          ..write('benefit: $benefit, ')
          ..write('value: $value, ')
          ..write('time: $time, ')
          ..write('totalValue: $totalValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(benefit.hashCode,
          $mrjc(value.hashCode, $mrjc(time.hashCode, totalValue.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Dbone &&
          other.id == this.id &&
          other.benefit == this.benefit &&
          other.value == this.value &&
          other.time == this.time &&
          other.totalValue == this.totalValue);
}

class DbonesCompanion extends UpdateCompanion<Dbone> {
  final Value<int> id;
  final Value<String> benefit;
  final Value<double> value;
  final Value<double> time;
  final Value<double> totalValue;
  const DbonesCompanion({
    this.id = const Value.absent(),
    this.benefit = const Value.absent(),
    this.value = const Value.absent(),
    this.time = const Value.absent(),
    this.totalValue = const Value.absent(),
  });
  DbonesCompanion.insert({
    this.id = const Value.absent(),
    this.benefit = const Value.absent(),
    this.value = const Value.absent(),
    this.time = const Value.absent(),
    this.totalValue = const Value.absent(),
  });
  DbonesCompanion copyWith(
      {Value<int> id,
      Value<String> benefit,
      Value<double> value,
      Value<double> time,
      Value<double> totalValue}) {
    return DbonesCompanion(
      id: id ?? this.id,
      benefit: benefit ?? this.benefit,
      value: value ?? this.value,
      time: time ?? this.time,
      totalValue: totalValue ?? this.totalValue,
    );
  }
}

class $DbonesTable extends Dbones with TableInfo<$DbonesTable, Dbone> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbonesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _benefitMeta = const VerificationMeta('benefit');
  GeneratedTextColumn _benefit;
  @override
  GeneratedTextColumn get benefit => _benefit ??= _constructBenefit();
  GeneratedTextColumn _constructBenefit() {
    return GeneratedTextColumn(
      'benefit',
      $tableName,
      true,
    );
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedRealColumn _value;
  @override
  GeneratedRealColumn get value => _value ??= _constructValue();
  GeneratedRealColumn _constructValue() {
    return GeneratedRealColumn(
      'value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  GeneratedRealColumn _time;
  @override
  GeneratedRealColumn get time => _time ??= _constructTime();
  GeneratedRealColumn _constructTime() {
    return GeneratedRealColumn(
      'time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _totalValueMeta = const VerificationMeta('totalValue');
  GeneratedRealColumn _totalValue;
  @override
  GeneratedRealColumn get totalValue => _totalValue ??= _constructTotalValue();
  GeneratedRealColumn _constructTotalValue() {
    return GeneratedRealColumn(
      'total_value',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, benefit, value, time, totalValue];
  @override
  $DbonesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'dbones';
  @override
  final String actualTableName = 'dbones';
  @override
  VerificationContext validateIntegrity(DbonesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.benefit.present) {
      context.handle(_benefitMeta,
          benefit.isAcceptableValue(d.benefit.value, _benefitMeta));
    }
    if (d.value.present) {
      context.handle(
          _valueMeta, value.isAcceptableValue(d.value.value, _valueMeta));
    }
    if (d.time.present) {
      context.handle(
          _timeMeta, time.isAcceptableValue(d.time.value, _timeMeta));
    }
    if (d.totalValue.present) {
      context.handle(_totalValueMeta,
          totalValue.isAcceptableValue(d.totalValue.value, _totalValueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Dbone map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Dbone.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbonesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.benefit.present) {
      map['benefit'] = Variable<String, StringType>(d.benefit.value);
    }
    if (d.value.present) {
      map['value'] = Variable<double, RealType>(d.value.value);
    }
    if (d.time.present) {
      map['time'] = Variable<double, RealType>(d.time.value);
    }
    if (d.totalValue.present) {
      map['total_value'] = Variable<double, RealType>(d.totalValue.value);
    }
    return map;
  }

  @override
  $DbonesTable createAlias(String alias) {
    return $DbonesTable(_db, alias);
  }
}

class Dbtwo extends DataClass implements Insertable<Dbtwo> {
  final int id;
  final String benefit;
  final double value;
  Dbtwo({@required this.id, this.benefit, this.value});
  factory Dbtwo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Dbtwo(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      benefit:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}benefit']),
      value:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
    );
  }
  factory Dbtwo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Dbtwo(
      id: serializer.fromJson<int>(json['id']),
      benefit: serializer.fromJson<String>(json['benefit']),
      value: serializer.fromJson<double>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'benefit': serializer.toJson<String>(benefit),
      'value': serializer.toJson<double>(value),
    };
  }

  @override
  DbtwosCompanion createCompanion(bool nullToAbsent) {
    return DbtwosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      benefit: benefit == null && nullToAbsent
          ? const Value.absent()
          : Value(benefit),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  Dbtwo copyWith({int id, String benefit, double value}) => Dbtwo(
        id: id ?? this.id,
        benefit: benefit ?? this.benefit,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('Dbtwo(')
          ..write('id: $id, ')
          ..write('benefit: $benefit, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(benefit.hashCode, value.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Dbtwo &&
          other.id == this.id &&
          other.benefit == this.benefit &&
          other.value == this.value);
}

class DbtwosCompanion extends UpdateCompanion<Dbtwo> {
  final Value<int> id;
  final Value<String> benefit;
  final Value<double> value;
  const DbtwosCompanion({
    this.id = const Value.absent(),
    this.benefit = const Value.absent(),
    this.value = const Value.absent(),
  });
  DbtwosCompanion.insert({
    this.id = const Value.absent(),
    this.benefit = const Value.absent(),
    this.value = const Value.absent(),
  });
  DbtwosCompanion copyWith(
      {Value<int> id, Value<String> benefit, Value<double> value}) {
    return DbtwosCompanion(
      id: id ?? this.id,
      benefit: benefit ?? this.benefit,
      value: value ?? this.value,
    );
  }
}

class $DbtwosTable extends Dbtwos with TableInfo<$DbtwosTable, Dbtwo> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbtwosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _benefitMeta = const VerificationMeta('benefit');
  GeneratedTextColumn _benefit;
  @override
  GeneratedTextColumn get benefit => _benefit ??= _constructBenefit();
  GeneratedTextColumn _constructBenefit() {
    return GeneratedTextColumn(
      'benefit',
      $tableName,
      true,
    );
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedRealColumn _value;
  @override
  GeneratedRealColumn get value => _value ??= _constructValue();
  GeneratedRealColumn _constructValue() {
    return GeneratedRealColumn(
      'value',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, benefit, value];
  @override
  $DbtwosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'dbtwos';
  @override
  final String actualTableName = 'dbtwos';
  @override
  VerificationContext validateIntegrity(DbtwosCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.benefit.present) {
      context.handle(_benefitMeta,
          benefit.isAcceptableValue(d.benefit.value, _benefitMeta));
    }
    if (d.value.present) {
      context.handle(
          _valueMeta, value.isAcceptableValue(d.value.value, _valueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Dbtwo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Dbtwo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbtwosCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.benefit.present) {
      map['benefit'] = Variable<String, StringType>(d.benefit.value);
    }
    if (d.value.present) {
      map['value'] = Variable<double, RealType>(d.value.value);
    }
    return map;
  }

  @override
  $DbtwosTable createAlias(String alias) {
    return $DbtwosTable(_db, alias);
  }
}

class Dbonessample extends DataClass implements Insertable<Dbonessample> {
  final String benefits;
  Dbonessample({this.benefits});
  factory Dbonessample.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Dbonessample(
      benefits: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}benefits']),
    );
  }
  factory Dbonessample.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Dbonessample(
      benefits: serializer.fromJson<String>(json['benefits']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'benefits': serializer.toJson<String>(benefits),
    };
  }

  @override
  DbonessamplesCompanion createCompanion(bool nullToAbsent) {
    return DbonessamplesCompanion(
      benefits: benefits == null && nullToAbsent
          ? const Value.absent()
          : Value(benefits),
    );
  }

  Dbonessample copyWith({String benefits}) => Dbonessample(
        benefits: benefits ?? this.benefits,
      );
  @override
  String toString() {
    return (StringBuffer('Dbonessample(')
          ..write('benefits: $benefits')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(benefits.hashCode);
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Dbonessample && other.benefits == this.benefits);
}

class DbonessamplesCompanion extends UpdateCompanion<Dbonessample> {
  final Value<String> benefits;
  const DbonessamplesCompanion({
    this.benefits = const Value.absent(),
  });
  DbonessamplesCompanion.insert({
    this.benefits = const Value.absent(),
  });
  DbonessamplesCompanion copyWith({Value<String> benefits}) {
    return DbonessamplesCompanion(
      benefits: benefits ?? this.benefits,
    );
  }
}

class $DbonessamplesTable extends Dbonessamples
    with TableInfo<$DbonessamplesTable, Dbonessample> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbonessamplesTable(this._db, [this._alias]);
  final VerificationMeta _benefitsMeta = const VerificationMeta('benefits');
  GeneratedTextColumn _benefits;
  @override
  GeneratedTextColumn get benefits => _benefits ??= _constructBenefits();
  GeneratedTextColumn _constructBenefits() {
    return GeneratedTextColumn(
      'benefits',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [benefits];
  @override
  $DbonessamplesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'dbonessamples';
  @override
  final String actualTableName = 'dbonessamples';
  @override
  VerificationContext validateIntegrity(DbonessamplesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.benefits.present) {
      context.handle(_benefitsMeta,
          benefits.isAcceptableValue(d.benefits.value, _benefitsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Dbonessample map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Dbonessample.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbonessamplesCompanion d) {
    final map = <String, Variable>{};
    if (d.benefits.present) {
      map['benefits'] = Variable<String, StringType>(d.benefits.value);
    }
    return map;
  }

  @override
  $DbonessamplesTable createAlias(String alias) {
    return $DbonessamplesTable(_db, alias);
  }
}

class Dbtwossample extends DataClass implements Insertable<Dbtwossample> {
  final String benefits;
  Dbtwossample({this.benefits});
  factory Dbtwossample.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Dbtwossample(
      benefits: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}benefits']),
    );
  }
  factory Dbtwossample.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Dbtwossample(
      benefits: serializer.fromJson<String>(json['benefits']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'benefits': serializer.toJson<String>(benefits),
    };
  }

  @override
  DbtwossamplesCompanion createCompanion(bool nullToAbsent) {
    return DbtwossamplesCompanion(
      benefits: benefits == null && nullToAbsent
          ? const Value.absent()
          : Value(benefits),
    );
  }

  Dbtwossample copyWith({String benefits}) => Dbtwossample(
        benefits: benefits ?? this.benefits,
      );
  @override
  String toString() {
    return (StringBuffer('Dbtwossample(')
          ..write('benefits: $benefits')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(benefits.hashCode);
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Dbtwossample && other.benefits == this.benefits);
}

class DbtwossamplesCompanion extends UpdateCompanion<Dbtwossample> {
  final Value<String> benefits;
  const DbtwossamplesCompanion({
    this.benefits = const Value.absent(),
  });
  DbtwossamplesCompanion.insert({
    this.benefits = const Value.absent(),
  });
  DbtwossamplesCompanion copyWith({Value<String> benefits}) {
    return DbtwossamplesCompanion(
      benefits: benefits ?? this.benefits,
    );
  }
}

class $DbtwossamplesTable extends Dbtwossamples
    with TableInfo<$DbtwossamplesTable, Dbtwossample> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbtwossamplesTable(this._db, [this._alias]);
  final VerificationMeta _benefitsMeta = const VerificationMeta('benefits');
  GeneratedTextColumn _benefits;
  @override
  GeneratedTextColumn get benefits => _benefits ??= _constructBenefits();
  GeneratedTextColumn _constructBenefits() {
    return GeneratedTextColumn(
      'benefits',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [benefits];
  @override
  $DbtwossamplesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'dbtwossamples';
  @override
  final String actualTableName = 'dbtwossamples';
  @override
  VerificationContext validateIntegrity(DbtwossamplesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.benefits.present) {
      context.handle(_benefitsMeta,
          benefits.isAcceptableValue(d.benefits.value, _benefitsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Dbtwossample map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Dbtwossample.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbtwossamplesCompanion d) {
    final map = <String, Variable>{};
    if (d.benefits.present) {
      map['benefits'] = Variable<String, StringType>(d.benefits.value);
    }
    return map;
  }

  @override
  $DbtwossamplesTable createAlias(String alias) {
    return $DbtwossamplesTable(_db, alias);
  }
}

abstract class _$TitheDb extends GeneratedDatabase {
  _$TitheDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DbonesTable _dbones;
  $DbonesTable get dbones => _dbones ??= $DbonesTable(this);
  $DbtwosTable _dbtwos;
  $DbtwosTable get dbtwos => _dbtwos ??= $DbtwosTable(this);
  $DbonessamplesTable _dbonessamples;
  $DbonessamplesTable get dbonessamples =>
      _dbonessamples ??= $DbonessamplesTable(this);
  $DbtwossamplesTable _dbtwossamples;
  $DbtwossamplesTable get dbtwossamples =>
      _dbtwossamples ??= $DbtwossamplesTable(this);
  DboneDao _dboneDao;
  DboneDao get dboneDao => _dboneDao ??= DboneDao(this as TitheDb);
  DbtwoDao _dbtwoDao;
  DbtwoDao get dbtwoDao => _dbtwoDao ??= DbtwoDao(this as TitheDb);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [dbones, dbtwos, dbonessamples, dbtwossamples];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$DboneDaoMixin on DatabaseAccessor<TitheDb> {
  $DbonesTable get dbones => db.dbones;
}
mixin _$DbtwoDaoMixin on DatabaseAccessor<TitheDb> {
  $DbtwosTable get dbtwos => db.dbtwos;
}
