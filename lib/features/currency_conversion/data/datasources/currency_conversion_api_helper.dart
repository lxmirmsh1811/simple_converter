import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:simple_converter/features/currency_conversion/data/models/currency_info.dart';
import 'package:simple_converter/features/currency_conversion/data/models/symbols.dart';
import 'package:simple_converter/utils/api_helper.dart';
import 'package:http/http.dart' as http;

abstract class CurrencyConversionApiHelper {
  Future<List<Symbols>> getAllAvailableCurrencies();
  Future<CurrencyInfo> getCurrencyInfo(
      String convertFrom, String convertTo, double amount);
}

@Injectable(as: CurrencyConversionApiHelper)
class CurrencyConversionApiHelperImpl extends CurrencyConversionApiHelper {
  @override
  Future<CurrencyInfo> getCurrencyInfo(
      String convertFrom, String convertTo, double amount) async {
    try {
      CurrencyInfo? result;
      final url = Uri.parse(
          '${ApiHelper.convertAmountUrl}?to=$convertTo&from=$convertFrom&amount=$amount');

      var response = await http.get(url, headers: {'apiKey': ApiHelper.apiKey});
      if (response.statusCode == 200) {
        final jsonDecode = json.decode(response.body);
        result = CurrencyInfo.fromJson(jsonDecode);
      }

      return result ??
          CurrencyInfo(
              convertFrom: convertFrom, convertTo: convertTo, result: 0);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<Symbols>> getAllAvailableCurrencies() async {
    try {
      final List<Symbols> symbols = [];

      final url = Uri.parse(ApiHelper.availableCurrenciesUrl);
      var response = await http.get(url, headers: {'apiKey': ApiHelper.apiKey});
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonDecode = json.decode(response.body);
        jsonDecode['symbols'].forEach(
          (key, value) async {
            symbols.add(
              Symbols(
                currencyCode: key,
                currencyName: value,
                isFavorite: false,
              ),
            );
          },
        );
      }
      return symbols;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
