import 'package:flutter/material.dart';
import 'package:temp_sip/components/drink_tile.dart';
import 'package:temp_sip/models/drink_model.dart';
import 'package:temp_sip/services/drink_service.dart';
import 'package:temp_sip/services/weather_service.dart';

import '../models/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _weatherService = WeatherService();
  Weather? _weather;
  DrinkService? _drinkService; // Store DrinkService instance
  List<String>? _drinkList;

  Future<void> _fetchWeatherAndDrinks() async {
    try {
      // Fetch weather data
      String cityName = await _weatherService.getCurrentCity();
      final weather = await _weatherService.getWeather(cityName);

      // Load drinks from JSON file asynchronously
      String assetPath = 'assets/data/drinks.json'; // Update with correct path
      final drinkService =
          await DrinkService.fromJsonFile(weather.temperature, assetPath);
      // Update state with weather and drinks
      setState(() {
        _weather = weather;
        _drinkList = drinkService.getDrinks();
        print(_drinkList![1]);
      });
    } catch (e) {
      print('Error loading weather or drinks: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeatherAndDrinks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(_weather?.cityName ?? "City loading"),
            ),
            Text("${_weather?.temperature.round()}°C" ?? "Temp loading"),
            if (_drinkList != null) // Check if _drinkService is not null
              Expanded(
                child: ListView.builder(
                  itemCount: _drinkList!.length,
                  itemBuilder: (context, index) {
                    return DrinkTile(drinkName: _drinkList![index]);
                  },
                ),
              )
            else
              Text("Drinks data loading"), // Placeholder text while loading
          ],
        ),
      ),
    );
  }
}
