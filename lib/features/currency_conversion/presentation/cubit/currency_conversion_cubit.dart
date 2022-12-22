import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_converter/features/currency_conversion/data/models/currency_info.dart';
import 'package:simple_converter/features/currency_conversion/data/models/symbols.dart';
import 'package:simple_converter/features/currency_conversion/domain/repositories/currency_conversion_repository.dart';
import 'package:simple_converter/utils/service_locator.dart';

part 'currency_conversion_state.dart';

@injectable
class CurrencyConversionCubit extends Cubit<CurrencyConversionState> {
  CurrencyConversionCubit()
      : super(
          const CurrencyConversionInitial(
            currencyInfo:
                CurrencyInfo(convertFrom: '', convertTo: '', result: 0),
            currencyList: [],
          ),
        );

  Future<void> initPage() async {
    final currencyConversionRepository = getIt<CurrencyConversionRepository>();
    final currencies =
        await currencyConversionRepository.getAllAvailableCurrencies();

    emit(
      CurrencyConversionLoaded(
          currencyInfo: CurrencyInfo(
            convertFrom: currencies
                .firstWhere((element) => element.currencyCode == 'INR')
                .currencyName,
            convertTo: currencies
                .firstWhere((element) => element.currencyCode == 'EUR')
                .currencyName,
            result: 0,
          ),
          currencyList: currencies),
    );
  }

  Future<void> onCurrencyConversionRequest(
      String convertFrom, String amount) async {
    final currencyConversionRepository = getIt<CurrencyConversionRepository>();

    final convertFromCode = state.currencyList
        .firstWhere((currency) => currency.currencyName == convertFrom)
        .currencyCode;
    final currencyInfo = await currencyConversionRepository
        .getCurrencyConversion(convertFromCode, amount);

    emit(
      CurrencyConversionCalculated(
        currencyInfo: currencyInfo,
        currencyList: state.currencyList,
      ),
    );
  }
}
