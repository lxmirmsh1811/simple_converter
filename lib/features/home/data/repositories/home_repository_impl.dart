import 'package:injectable/injectable.dart';
import 'package:units_converter/units_converter.dart';

import '../../../../utils/helper_enums.dart';
import '../models/result.dart';

import '../../domain/repositories/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<Result> convertDistance(
      double value, Units fromUnit, Units toUnit) async {
    LENGTH convertFrom;
    LENGTH convertTo;
    double result = 0;
    if (fromUnit == Units.miles && toUnit == Units.km) {
      convertFrom = LENGTH.miles;
      convertTo = LENGTH.kilometers;
    } else {
      convertFrom = LENGTH.kilometers;
      convertTo = LENGTH.miles;
    }

    result = value.convertFromTo(convertFrom, convertTo) ?? 0;

    return Result(result: result, fromUnit: fromUnit, toUnit: toUnit);
  }

  @override
  Future<Result> convertLength(
      double value, Units fromUnit, Units toUnit) async {
    LENGTH convertFrom;
    LENGTH convertTo;
    double result = 0;
    if (fromUnit == Units.inches && toUnit == Units.cm) {
      convertFrom = LENGTH.inches;
      convertTo = LENGTH.centimeters;
    } else {
      convertFrom = LENGTH.centimeters;
      convertTo = LENGTH.inches;
    }
    result = value.convertFromTo(convertFrom, convertTo) ?? 0;
    return Result(result: result, fromUnit: fromUnit, toUnit: toUnit);
  }

  @override
  Future<Result> convertMass(double value, Units fromUnit, Units toUnit) async {
    MASS convertFrom;
    MASS convertTo;
    double result = 0;
    if (fromUnit == Units.lb && toUnit == Units.kg) {
      convertFrom = MASS.pounds;
      convertTo = MASS.kilograms;
    } else {
      convertFrom = MASS.kilograms;
      convertTo = MASS.pounds;
    }
    result = value.convertFromTo(convertFrom, convertTo) ?? 0;
    return Result(result: result, fromUnit: fromUnit, toUnit: toUnit);
  }

  @override
  Future<Result> convertTemperature(
      double value, Units fromUnit, Units toUnit) async {
    TEMPERATURE convertFrom;
    TEMPERATURE convertTo;
    double result = 0;
    if (fromUnit == Units.fahrenheit && toUnit == Units.celsius) {
      convertFrom = TEMPERATURE.fahrenheit;
      convertTo = TEMPERATURE.celsius;
    } else {
      convertFrom = TEMPERATURE.celsius;
      convertTo = TEMPERATURE.fahrenheit;
    }
    result = value.convertFromTo(convertFrom, convertTo) ?? 0;

    return Result(result: result, fromUnit: fromUnit, toUnit: toUnit);
  }
}
