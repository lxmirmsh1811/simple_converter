import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_converter/utils/helper_enums.dart';
import 'package:simple_converter/features/home/data/models/result.dart';
import 'package:simple_converter/utils/service_locator.dart';

import '../../domain/repositories/home_repository.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  late Units fromUnit;
  late Units toUnit;
  late Result result;
  bool isOriginal = true;
  late HomeRepository homeRepository;

  HomeCubit()
      : super(
          HomeWithValuesState(
            result: Result(
              result: 0,
              fromUnit: Units.inches,
              toUnit: Units.cm,
            ),
          ),
        );

  Future<void> initPage(Categories category) async {
    final unitList =
        categoriesToUnits[category] ?? categoriesToUnits[Categories.length]!;

    homeRepository = getIt<HomeRepository>();

    if (isOriginal) {
      fromUnit = unitList[0];
      toUnit = unitList[1];
      isOriginal = false;
    } else {
      fromUnit = unitList[1];
      toUnit = unitList[0];
      isOriginal = true;
    }
    result = Result(
      result: 0,
      fromUnit: fromUnit,
      toUnit: toUnit,
    );
    emit(HomeWithValuesState(result: result));
  }

  Future<void> chooseCalculation(Categories category, String text) async {
    final value = double.tryParse(text) ?? 0;

    if (category == Categories.length) {
      result = await _onLengthConversionTapped(value);
    } else if (category == Categories.distance) {
      result = await _onDistanceConversionTapped(value);
    } else if (category == Categories.mass) {
      result = await _onMassCalculationTapped(value);
    } else if (category == Categories.temperature) {
      result = await _onTemperatureConversionTapped(value);
    }

    emit(
      HomeWithValuesState(result: result),
    );
  }

  Future<Result> _onDistanceConversionTapped(double value) async {
    return homeRepository.convertDistance(value, fromUnit, toUnit);
  }

  Future<Result> _onLengthConversionTapped(double value) async {
    return await homeRepository.convertLength(value, fromUnit, toUnit);
  }

  Future<Result> _onTemperatureConversionTapped(double value) async {
    return await homeRepository.convertTemperature(value, fromUnit, toUnit);
  }

  Future<Result> _onMassCalculationTapped(double value) async {
    return await homeRepository.convertMass(value, fromUnit, toUnit);
  }
}
