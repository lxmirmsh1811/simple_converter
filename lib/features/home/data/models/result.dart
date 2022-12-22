import 'package:simple_converter/utils/helper_enums.dart';

class Result {
  final double result;
  final Units fromUnit;
  final Units toUnit;

  Result({
    required this.result,
    required this.fromUnit,
    required this.toUnit,
  });
}
