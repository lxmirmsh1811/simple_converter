import 'package:flutter/material.dart';

class FavoritesBottomSheet extends StatelessWidget {
  final List<String> favCurrencies;
  const FavoritesBottomSheet({
    Key? key,
    required this.favCurrencies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Flexible(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: favCurrencies.length,
              itemBuilder: (context, index) => SizedBox(
                height: 50,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      favCurrencies[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
