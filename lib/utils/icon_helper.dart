import 'package:flutter/material.dart';
import 'package:simple_converter/utils/helper_enums.dart';

class IconHelper {
  IconHelper._();
  static const currency = Icon(
    Icons.euro_symbol_outlined,
    color: Colors.black45,
  );
  static final length = SizedBox(
    height: 24,
    width: 24,
    child: Image.asset(
      'assets/length.png',
    ),
  );
  static final upDown = Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
    ),
    height: 50,
    width: 50,
    child: Image.asset(
      'assets/up-and-down-arrow.png',
    ),
  );

  static const mass = Icon(
    Icons.scale_sharp,
    color: Colors.black45,
  );
  static const temperature = Icon(
    Icons.thermostat,
    color: Colors.black45,
  );
  static const distance = Icon(
    Icons.map,
    color: Colors.black45,
  );

  static getIcon(String categoryName) {
    if (categoryName.toLowerCase().contains('currency')) {
      return currency;
    } else if (categoryName.toLowerCase().contains(Categories.mass.name)) {
      return mass;
    } else if (categoryName
        .toLowerCase()
        .contains(Categories.temperature.name)) {
      return temperature;
    } else if (categoryName.toLowerCase().contains(Categories.distance.name)) {
      return distance;
    } else {
      return length;
    }
  }
}
