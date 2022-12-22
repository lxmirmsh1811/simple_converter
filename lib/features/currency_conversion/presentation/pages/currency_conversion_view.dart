import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:simple_converter/features/currency_conversion/presentation/cubit/currency_conversion_cubit.dart';
import 'package:simple_converter/features/currency_conversion/presentation/widgets/favorites_bottomsheet.dart';
import 'package:simple_converter/utils/icon_helper.dart';

class CurrencyConversionView extends StatefulWidget {
  const CurrencyConversionView({Key? key}) : super(key: key);

  @override
  State<CurrencyConversionView> createState() => _CurrencyConversionViewState();
}

class _CurrencyConversionViewState extends State<CurrencyConversionView> {
  TextEditingController textEditingController =
      TextEditingController(text: '0');
  String? dropDownItem;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();

    final currencyConversionCubit = context.read<CurrencyConversionCubit>();

    return BlocBuilder<CurrencyConversionCubit, CurrencyConversionState>(
      builder: (context, state) {
        if (state is CurrencyConversionInitial) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.amber,
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => focusNode.unfocus(),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.43,
                        color: Colors.grey[850],
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: TextField(
                                    controller: textEditingController,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: true, decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 36,
                                      color: Colors.amber,
                                    ),
                                    focusNode: focusNode,
                                    decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      fillColor: Colors.grey[850],
                                      filled: true,
                                    ),
                                  ),
                                ),
                                if (state.currencyList.isNotEmpty)
                                  DropdownButton<String>(
                                    focusColor: Colors.amber,
                                    style: const TextStyle(color: Colors.amber),
                                    value: dropDownItem,
                                    items: [
                                      for (final item in state.currencyList)
                                        DropdownMenuItem(
                                          value: item.currencyName,
                                          child: Text(item.currencyName),
                                        ),
                                    ],
                                    onChanged: (value) => {
                                      setState(
                                        () {
                                          dropDownItem = value ?? '';
                                        },
                                      )
                                    },
                                  )
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
                                state.currencyInfo.result.toString(),
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Colors.grey[850],
                                ),
                              ),
                              Text(
                                state.currencyInfo.convertTo,
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
                  onPressed: () => {
                    currencyConversionCubit.onCurrencyConversionRequest(
                        dropDownItem ?? state.currencyInfo.convertFrom,
                        textEditingController.text)
                  },
                  icon: IconHelper.upDown,
                ),
                const Positioned(
                  right: 20,
                  top: 20,
                  child: LikeButton(
                    size: 25,
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Colors.amber,
                      dotSecondaryColor: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: IconButton(
                    icon: const Icon(
                      Icons.remove_red_eye,
                    ),
                    onPressed: () => {
                      showBottomSheet(
                        context: context,
                        builder: (context) => FractionallySizedBox(
                          heightFactor: 0.6,
                          child: BlocProvider.value(
                            value: currencyConversionCubit,
                            child: FavoritesBottomSheet(
                              favCurrencies: state.currencyList
                                  .map((e) => e.currencyName)
                                  .toList(),
                            ),
                          ),
                        ),
                      )
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
