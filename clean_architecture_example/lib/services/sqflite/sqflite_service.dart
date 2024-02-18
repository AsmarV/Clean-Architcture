import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/constants/constants.export.dart';

class SqfLiteService {
  ///INITIAL -DB-
  final String _db_name = 'app_db';

  Database? _database;

  Future<Database> get database async => _database ??= await _initDB();

  Future<Database> _initDB() async {
    return await openDatabase(join(await getDatabasesPath(), _db_name),
        onCreate: (Database db, int version) async {
      await db.execute(sqlProductTable);
    });
  }

  ///GET BY ID FROM TABLE-NAMED
  Future<List<Map>> getById(
      {required tableName,
      required int id,
      List<String>? column,
      String? whereStatement}) async {
    final db = await database;

    final List<Map> maps = await db.query(tableName,
        columns: column, where: whereStatement, whereArgs: [id]);

    return maps;
  }

  ///INSERT ON TABLE-NAMED
  Future<int> insert(
      {required String tableName, required Map<String, dynamic> value}) async {
    final db = await database;
    return await db.insert(tableName, value);
  }

  ///INSERT-All ON TABLE-NAMED
  Future insertAll(
      {required String tableName,
      required List<Map<String, dynamic>> value}) async {
    final db = await database;
    value.map((e) async => await db.insert(tableName, e)).toList();
  }

  ///DELETE BY ID FROM TABLE-NAMED
  Future<int> delete(
      {required tableName, required int id, String? whereStatement}) async {
    final db = await database;

    return await db.delete(tableName, where: whereStatement, whereArgs: [id]);
  }

  ///UPDATE ON TABLE-NAMED
  Future update(
      {required String tableName,
      required int id,
      required Map<String, dynamic> value,
      String? whereStatement}) async {
    final db = await database;

    return await db
        .update(tableName, value, where: whereStatement, whereArgs: [id]);
  }

  ///CLOSE - DB -
  Future close() async {
    final db = await database;
    db.close();
  }
}
