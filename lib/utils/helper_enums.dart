enum Categories {
  length,
  mass,
  temperature,
  distance,
}

extension CategoryName on Categories {
  String get categoryName {
    switch (this) {
      case Categories.length:
        return 'Length';
      case Categories.mass:
        return 'Mass';
      case Categories.temperature:
        return 'Temperature';
      case Categories.distance:
        return 'Distance';
      default:
        return 'Length';
    }
  }
}

enum Units {
  cm('cm'),
  inches('inches'),
  km('km'),
  miles('miles'),
  kg('kg'),
  lb('pounds'),
  kelvin('kelvin'),
  celsius('celsius'),
  fahrenheit('fahrenheit');

  const Units(this.name);
  final String name;
}

Map<Categories, List<Units>> categoriesToUnits = {
  Categories.length: [Units.inches, Units.cm],
  Categories.mass: [Units.lb, Units.kg],
  // Categories.currency: [],
  Categories.temperature: [Units.fahrenheit, Units.celsius],
  Categories.distance: [Units.miles, Units.km],
};
