import '../../../../utils/helper_enums.dart';
import '../../data/models/result.dart';

abstract class HomeRepository {
  Future<Result> convertLength(double value, Units fromUnit, Units toUnit);

  Future<Result> convertDistance(double value, Units fromUnit, Units toUnit);

  Future<Result> convertMass(double value, Units fromUnit, Units toUnit);

  Future<Result> convertTemperature(double value, Units fromUnit, Units toUnit);
}
