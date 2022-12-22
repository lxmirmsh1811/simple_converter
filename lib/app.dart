import 'package:flutter/material.dart';
import 'package:simple_converter/features/currency_conversion/presentation/pages/currency_conversion_page.dart';
import 'package:simple_converter/features/home/presentation/pages/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(),
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[850],
          centerTitle: true,
        ),
        selectedRowColor: Colors.amber,
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.amber),
      ),
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => const Home(),
        CurrencyConversionPage.routeName: (context) =>
            const CurrencyConversionPage(),
      },
    );
  }
}
