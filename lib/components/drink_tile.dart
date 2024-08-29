import 'package:flutter/material.dart';

class DrinkTile extends StatelessWidget {
  final String drinkName;
  const DrinkTile({super.key, required this.drinkName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.lightBlue,
        ),
        child: Center(
          child: Text(
            drinkName,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
