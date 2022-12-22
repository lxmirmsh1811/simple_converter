import 'package:flutter/material.dart';
import 'package:simple_converter/features/currency_conversion/presentation/pages/currency_conversion_page.dart';

import 'package:simple_converter/utils/helper_enums.dart';
import 'package:simple_converter/features/home/presentation/pages/home.dart';
import 'package:simple_converter/utils/icon_helper.dart';

class ConversionDrawer extends StatelessWidget {
  const ConversionDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const DrawerHeader(
              child: Center(
                child: Text(
                  'Conversion Categories ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(
                context,
                CurrencyConversionPage.routeName,
              ),
              child: Card(
                elevation: 8,
                shadowColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconHelper.getIcon('currency'),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Currency',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: Categories.values.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, Home.routeName,
                            arguments: HomePageArguments(
                              pageTitle: Categories.values[index],
                            )),
                    child: Card(
                      key: ValueKey(Categories.values[index].categoryName),
                      elevation: 8,
                      shadowColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconHelper.getIcon(
                                  Categories.values[index].categoryName),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                Categories.values[index].categoryName,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
