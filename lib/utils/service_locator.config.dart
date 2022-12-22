// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/currency_conversion/data/datasources/currency_conversion_api_helper.dart'
    as _i3;
import '../features/currency_conversion/data/datasources/currency_conversion_db_helper.dart'
    as _i5;
import '../features/currency_conversion/data/repositories/currency_conversion_repository_impl.dart'
    as _i7;
import '../features/currency_conversion/domain/repositories/currency_conversion_repository.dart'
    as _i6;
import '../features/currency_conversion/presentation/cubit/currency_conversion_cubit.dart'
    as _i4;
import '../features/home/data/repositories/home_repository_impl.dart' as _i10;
import '../features/home/domain/repositories/home_repository.dart' as _i9;
import '../features/home/presentation/cubit/home_cubit.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.CurrencyConversionApiHelper>(
      () => _i3.CurrencyConversionApiHelperImpl());
  gh.factory<_i4.CurrencyConversionCubit>(() => _i4.CurrencyConversionCubit());
  gh.factory<_i5.CurrencyConversionDbHelper>(
      () => _i5.CurrencyConversionDbHelperImpl());
  gh.factory<_i6.CurrencyConversionRepository>(
      () => _i7.CurrencyConversionRepositoryImpl());
  gh.factory<_i8.HomeCubit>(() => _i8.HomeCubit());
  gh.factory<_i9.HomeRepository>(() => _i10.HomeRepositoryImpl());
  return get;
}
