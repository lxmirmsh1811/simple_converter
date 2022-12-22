part of 'currency_conversion_cubit.dart';

abstract class CurrencyConversionState extends Equatable {
  final CurrencyInfo currencyInfo;
  final List<Symbols> currencyList;

  const CurrencyConversionState({
    required this.currencyInfo,
    required this.currencyList,
  });
}

class CurrencyConversionInitial extends CurrencyConversionState {
  const CurrencyConversionInitial({
    required super.currencyInfo,
    required super.currencyList,
  });

  @override
  List<Object?> get props => [];
}

class CurrencyConversionLoaded extends CurrencyConversionState {
  const CurrencyConversionLoaded({
    required super.currencyInfo,
    required super.currencyList,
  });

  @override
  List<Object?> get props => [
        currencyInfo,
        currencyList,
      ];
}

class CurrencyConversionCalculated extends CurrencyConversionState {
  const CurrencyConversionCalculated({
    required super.currencyInfo,
    required super.currencyList,
  });

  @override
  List<Object?> get props => [
        currencyInfo,
        currencyList,
      ];
}
