import 'package:flutter/material.dart';
import 'package:siptemp/components/drink_tile.dart';
import 'package:siptemp/models/drink_model.dart';

class TileBuilder extends StatelessWidget {
  const TileBuilder({
    super.key,
    required List<Drink>? drinkList,
  }) : _drinkList = drinkList;

  final List<Drink>? _drinkList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _drinkList!.length,
      itemBuilder: (context, index) {
        return DrinkTile(drink: _drinkList[index]);
      },
    );
  }
}
