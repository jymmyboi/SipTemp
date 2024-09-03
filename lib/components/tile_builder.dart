import 'package:flutter/material.dart';
import 'package:siptemp/components/drink_tile.dart';

class TileBuilder extends StatelessWidget {
  const TileBuilder({
    super.key,
    required List<String>? drinkList,
  }) : _drinkList = drinkList;

  final List<String>? _drinkList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _drinkList!.length,
      itemBuilder: (context, index) {
        return DrinkTile(drinkName: _drinkList[index]);
      },
    );
  }
}
