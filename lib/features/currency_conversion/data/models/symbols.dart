import 'package:equatable/equatable.dart';

class Symbols extends Equatable {
  final int? id;
  final String currencyCode;
  final String currencyName;
  final bool isFavorite;

  const Symbols({
    this.id,
    required this.currencyCode,
    required this.currencyName,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [currencyCode, currencyName, isFavorite];
}

///DATABASE REGION
const String symbolsTableName = 'symbolsTable';

class SymbolFields {
  static const String id = '_id';
  static const String currencyCode = 'currencyCode';
  static const String currencyName = 'currencyName';
  static const String isFavorite = 'isFavorite';
}
