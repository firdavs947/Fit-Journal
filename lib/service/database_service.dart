import 'package:fitjournal/models/fit_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static const String tableName = "fit";

  static Future<void> init(String filePath) async {
    if (_db != null && _db!.isOpen) {
      print('БД уже открыта');
      return;
    }

    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, filePath);
      _db = await openDatabase(path, version: 1, onCreate: _createDB);
      print('БД успешно инициализирована');
    } catch (e) {
      print('Ошибка инициализации БД: $e');
    }
  }

  static Future _createDB(Database database, int version) async {
    await database.execute('''
    CREATE TABLE $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      note TEXT,
      value REAL,
      createdAt TEXT,
      kg INTEGER
    )
  ''');
  }

 static Future<void> addFitToDb(FitModel fit) async {
  if (_db == null) {
    throw Exception("БД не инициализирована");
  }
  Map<String, dynamic> row = {
    'note': fit.note,
    'value': fit.value,
    'kg': fit.kg,
  };
  final id = await _db!.insert(tableName, row);
  print('Inserted row id: $id'); 
}

  static Future<List<FitModel>> getAllfits() async {
    if (_db == null) return [];
    
    final List<Map<String, dynamic>> fitList = await _db!.query(tableName);

    return List.generate(fitList.length, (index) {
      final row = fitList[index];
      return FitModel(
        id: row['id'] as int,
        note: row['note'] as String? ?? "Empty",
        value: (row['value'] as num).toDouble(),
        kg: row['kg'] as int,
      );
    });
  }

  static Future<void> clearDb() async {
    if (_db != null) await _db!.delete(tableName);
  }

  static Future<void> deleteItemInDb(int id) async {
    try {
      if (_db != null) {
        await _db!.delete(tableName, where: "id =?", whereArgs: [id]);
      }
    } catch (e) {
      print('Ошибка удаления: $e');
    }
  }
}