import 'package:simple_converter/features/currency_conversion/data/models/currency_info.dart';
import 'package:simple_converter/features/currency_conversion/data/models/symbols.dart';

abstract class CurrencyConversionRepository {
  Future<List<Symbols>> getAllAvailableCurrencies();
  Future<CurrencyInfo> getCurrencyConversion(String currency, String value);
  Future<int> updateFavorites(Symbols symbol);
}
