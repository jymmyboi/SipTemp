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
      body: Text(_drinkDescription),
    );
  }
}

//TODO: Implement this page. I know how it needs to be done, but will be a solid afternoon of hacking together.