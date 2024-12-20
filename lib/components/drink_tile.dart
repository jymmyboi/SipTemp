import 'package:flutter/material.dart';
import 'package:siptemp/models/drink_model.dart';
import 'package:siptemp/pages/drink_page.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  const DrinkTile({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DrinkPage(
                  drinkDescription: drink.description,
                  drinkName: drink.name,
                ),
              ));
        },
        child: Container(
          width: 200,
          height: 100,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 0, 150, 136),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    drink.name,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.arrow_circle_right,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
