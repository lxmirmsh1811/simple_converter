import 'package:injectable/injectable.dart';
import 'package:simple_converter/core/db/converter_db.dart';
import 'package:simple_converter/features/currency_conversion/data/models/symbols.dart';
import 'package:sqflite/sqflite.dart';

abstract class CurrencyConversionDbHelper {
  Future<int> insertIntoTable(Map<String, dynamic> row);
  Future<List<Map<String, dynamic>>> getAllTableEntries();
  Future<int> updateForRow(int id, Map<String, dynamic> row);
}

@Injectable(as: CurrencyConversionDbHelper)
class CurrencyConversionDbHelperImpl extends CurrencyConversionDbHelper {
  @override
  Future<int> insertIntoTable(Map<String, dynamic> row) async {
    Database db = await ConverterDB.databaseInstance.db;
    return await db.insert(symbolsTableName, row);
  }

  @override
  Future<List<Map<String, dynamic>>> getAllTableEntries() async {
    Database db = await ConverterDB.databaseInstance.db;
    return db.query(symbolsTableName);
  }

  @override
  Future<int> updateForRow(int id, Map<String, dynamic> row) async {
    Database db = await ConverterDB.databaseInstance.db;
    return db.update(
      symbolsTableName,
      row,
      where: '${SymbolFields.id} = ?',
      whereArgs: [id],
    );
  }
}
