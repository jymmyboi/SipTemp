import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
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

  List<Drink> getDrinks() {
    List<Drink> drinkList = [];
    for (var drink in drinks) {
      if (currentTemp >= drink.minTemp && currentTemp <= drink.maxTemp) {
        drinkList.add(drink);
      }
    }
    return drinkList;
  }

  List<String> getTypes() {
    List<String> typeList = [];
    for (var drink in drinks) {
      if (!typeList.contains(drink.type)) {
        typeList.add(drink.type);
      }
    }
    return typeList;
  }
}
