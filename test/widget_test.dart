// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_converter/features/home/presentation/cubit/home_cubit.dart';
import 'package:simple_converter/features/home/presentation/pages/home.dart';
import 'package:simple_converter/utils/service_locator.dart';

void main() {
  testWidgets('Find Text', (WidgetTester tester) async {
    //FIND ALL WIDGETS NEED FOR TEST
    final textField = find.byKey(const ValueKey('textField'));

    //INITIATE TESTING
    await tester.pumpWidget(const MaterialApp(home: Home()));

    //ACTIONS
    await tester.enterText(textField, '23');
    await tester.pump();

    expect(find.text('23'), findsOneWidget);
    await tester.pump();
    expect(find.text('58.42'), findsOneWidget);

    // expect(find.text('Mass'), findsOneWidget);
  });

  testWidgets('Interchange Units', (WidgetTester tester) async {
    //FIND ALL WIDGETS NEED FOR TEST
    final interchangeUnitsIcon = find.byKey(const ValueKey('interchangeUnits'));

    //INITIATE TESTING
    await tester.pumpWidget(const MaterialApp(home: Home()));

    //ACTIONS

    await tester.tap(interchangeUnitsIcon);

    expect(find.text('INCHES'), findsOneWidget);
  });

  testWidgets('Testing with Cubit', (WidgetTester tester) async {
    await configureDependencies({Environment.test});
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(
        create: (context) => getIt<HomeCubit>(),
        child: const Home(),
      ),
    ));

    expect(find.text('0.00'), findsOneWidget);
  });
}
