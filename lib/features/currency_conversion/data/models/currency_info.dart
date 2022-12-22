import 'package:equatable/equatable.dart';

class CurrencyInfo extends Equatable {
  final String convertFrom;
  final String convertTo;
  final double result;

  const CurrencyInfo({
    required this.convertFrom,
    required this.convertTo,
    required this.result,
  });

  @override
  List<Object?> get props => [convertFrom, convertTo, result];

  factory CurrencyInfo.fromJson(Map<dynamic, dynamic> json) => CurrencyInfo(
        convertFrom: (json['query']['from'] as String),
        convertTo: (json['query']['to']) as String,
        result: (json['result'] as num).toDouble(),
      );
}
