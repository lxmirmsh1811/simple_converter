import 'package:injectable/injectable.dart';
import 'package:simple_converter/features/currency_conversion/data/datasources/currency_conversion_api_helper.dart';
import 'package:simple_converter/features/currency_conversion/data/datasources/currency_conversion_db_helper.dart';
import 'package:simple_converter/features/currency_conversion/data/models/currency_info.dart';
import 'package:simple_converter/features/currency_conversion/data/models/symbols.dart';
import 'package:simple_converter/features/currency_conversion/domain/repositories/currency_conversion_repository.dart';

import 'package:simple_converter/utils/service_locator.dart';

@Injectable(as: CurrencyConversionRepository)
class CurrencyConversionRepositoryImpl extends CurrencyConversionRepository {
  final apiHelper = getIt<CurrencyConversionApiHelper>();
  final dbHelper = getIt<CurrencyConversionDbHelper>();
  @override
  Future<List<Symbols>> getAllAvailableCurrencies() async {
    List<Symbols> symbols = [];
    final localSymbolsList = await dbHelper.getAllTableEntries();

    if (localSymbolsList.isEmpty) {
      symbols.clear();
      symbols = await apiHelper.getAllAvailableCurrencies();
      _loadLocalDB(symbols);
    } else {
      symbols.clear();
      for (var symbol in localSymbolsList) {
        symbols.add(
          Symbols(
            currencyCode: symbol[SymbolFields.currencyCode],
            currencyName: symbol[SymbolFields.currencyName],
            isFavorite:
                symbol[SymbolFields.isFavorite].toString().contains('true'),
          ),
        );
      }
    }

    return symbols;
  }

  @override
  Future<CurrencyInfo> getCurrencyConversion(
      String currency, String value) async {
    final conversionAmount = double.parse(value);

    return apiHelper.getCurrencyInfo(currency, 'EUR', conversionAmount);
  }

  Future<void> _loadLocalDB(List<Symbols> symbols) async {
    for (var symbol in symbols) {
      await dbHelper.insertIntoTable(
        {
          SymbolFields.currencyCode: symbol.currencyCode,
          SymbolFields.currencyName: symbol.currencyName,
          SymbolFields.isFavorite: symbol.isFavorite.toString(),
        },
      );
    }
  }

  @override
  Future<int> updateFavorites(Symbols symbol) async {
    //TODO: finish update is favorite
    return 0;
  }
}
