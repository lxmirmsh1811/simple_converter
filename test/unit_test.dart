import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as i;
import 'package:simple_converter/features/home/domain/repositories/home_repository.dart';
import 'package:simple_converter/utils/helper_enums.dart';
import 'package:simple_converter/utils/service_locator.dart';

Future<void> main() async {
  await configureDependencies({i.Environment.test});
  final homeRepository = getIt<HomeRepository>();

  group('Testing Calculations', (() {
    test('Testing Length Conversion', () async {
      final res = await homeRepository
          .convertLength(23, Units.inches, Units.cm)
          .then((value) => value.result);

      expect(res, 58.42);
    });
  }));
}
