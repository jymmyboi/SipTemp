import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';
import '../models/drink_model.dart';

class DrinkService {
  final double currentTemp;
  final List<Drink> drinks;

  DrinkService(this.currentTemp, this.drinks);

  // Asynchronous factory method to create DrinkService from a JSON file
  static Future<DrinkService> fromJsonFile(
      double currentTemp, String assetPath) async {
    try {
      // Read the file asynchronously
      String jsonString = await rootBundle.loadString(assetPath);

      // Decode JSON
      List<dynamic> jsonList = jsonDecode(jsonString);

      // Convert JSON to List<Drink>
      List<Drink> drinks =
          jsonList.map((json) => Drink.fromJson(json)).toList();

      // Return an instance of DrinkService
      return DrinkService(currentTemp, drinks);
    } catch (e) {
      throw Exception('Failed to load drinks data: $e');
    }
  }

  List<String> getDrinks() {
    List<String> drinkList = [];
    for (var drink in drinks) {
      if (currentTemp >= drink.minTemp && currentTemp <= drink.maxTemp) {
        drinkList.add(drink.name);
        print(currentTemp.toString() +
            drink.name +
            drink.minTemp.toString() +
            drink.maxTemp.toString());
      }
    }
    return drinkList;
  }
}
