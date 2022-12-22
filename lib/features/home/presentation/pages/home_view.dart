import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_converter/utils/helper_enums.dart';
import 'package:simple_converter/utils/icon_helper.dart';

import '../cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  final Categories category;
  const HomeView({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();

    TextEditingController textEditingController = TextEditingController();

    final homeCubit = context.read<HomeCubit>()..initPage(category);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => focusNode.unfocus(),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.43,
                      color: Colors.grey[850],
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  state.result.fromUnit.name.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextField(
                                key: const ValueKey('textField'),
                                controller: textEditingController,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                style: const TextStyle(color: Colors.amber),
                                onChanged: (value) {
                                  homeCubit.chooseCalculation(
                                      category, textEditingController.text);
                                },
                                focusNode: focusNode,
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  fillColor: Colors.grey[850],
                                  filled: true,
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.43,
                    color: Colors.amber,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.result.result.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.grey[850],
                              ),
                            ),
                            Text(
                              state.result.toUnit.name.toUpperCase(),
                              style: TextStyle(
                                color: Colors.grey[850],
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                key: const ValueKey('interchangeUnits'),
                onPressed: () => {
                  homeCubit.initPage(category),
                  homeCubit.chooseCalculation(
                      category, textEditingController.text),
                },
                icon: IconHelper.upDown,
              ),
            ],
          ),
        );
      },
    );
  }
}
