import 'package:flutter/material.dart';

class DrinkPage extends StatelessWidget {
  const DrinkPage({
    super.key,
    required String drinkName,
    required String drinkDescription,
  })  : _drinkName = drinkName,
        _drinkDescription = drinkDescription;

  final String _drinkName;
  final String _drinkDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_drinkName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Text(
          _drinkDescription,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
