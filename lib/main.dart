import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_converter/app.dart';
import 'package:simple_converter/utils/service_locator.dart';

Future<void> main() async {
  await configureDependencies({Environment.dev});

  runApp(const App());
}
