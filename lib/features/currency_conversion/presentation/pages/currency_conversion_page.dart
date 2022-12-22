import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_converter/features/currency_conversion/presentation/cubit/currency_conversion_cubit.dart';
import 'package:simple_converter/utils/service_locator.dart';

import '../../../home/presentation/widgets/drawer.dart';
import 'currency_conversion_view.dart';

class CurrencyConversionPage extends StatelessWidget {
  static const String routeName = '/currencyConversion';
  const CurrencyConversionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      drawer: const ConversionDrawer(
        key: ValueKey('drawer'),
      ),
      appBar: AppBar(
        title: const Text(
          'Currency',
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<CurrencyConversionCubit>()..initPage(),
        child: const CurrencyConversionView(),
      ),
    );
  }
}
