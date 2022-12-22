import 'package:path_provider/path_provider.dart';
import 'package:simple_converter/features/currency_conversion/data/models/symbols.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ConverterDB {
  static final ConverterDB databaseInstance = ConverterDB._privateConst();
  ConverterDB._privateConst();

  static const _dbName = 'converter.db';

  static const _dbVersion = 1;
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initDB(_dbName);
    return _db!;
  }

  Future<Database> _initDB(String filePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final dbPath = join(directory.path, filePath);
    return await openDatabase(
      dbPath,
      version: _dbVersion,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const stringType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';

    ///Table 1
    const createSymbolTableQuery = '''CREATE TABLE $symbolsTableName(
      ${SymbolFields.id} $idType,
      ${SymbolFields.currencyCode} $stringType,
      ${SymbolFields.currencyName} $stringType,
      ${SymbolFields.isFavorite} $boolType
    )''';

    await db.execute(createSymbolTableQuery);
  }

  Future closeDB() async {
    final db = await databaseInstance.db;
    db.close();
  }
}
