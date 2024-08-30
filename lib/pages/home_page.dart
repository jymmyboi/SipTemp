import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:temp_sip/components/tile_builder.dart';
import 'package:temp_sip/pages/settings_page.dart';
import 'package:temp_sip/services/drink_service.dart';
import 'package:temp_sip/services/weather_service.dart';

import '../models/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Logger logger = Logger();
  final _weatherService = WeatherService();
  Weather? _weather;
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
      });
    } catch (e) {
      logger.e('Error loading weather or drinks: $e');
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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 121, 107),
        title: const Text(
          "SipTemp",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ));
              },
              icon: const Icon(
                Icons.settings,
                color: Color.fromARGB(255, 255, 255, 255),
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                _weather?.cityName ?? "City loading",
                style: const TextStyle(color: Color.fromARGB(255, 33, 33, 33)),
              ),
            ),
            Text(
              "${_weather?.temperature.round()}°C",
              style: const TextStyle(
                fontSize: 35,
                color: Color.fromARGB(255, 33, 33, 33),
              ),
            ),
            if (_drinkList != null) // Check if _drinkService is not null
              Expanded(
                child: TileBuilder(drinkList: _drinkList),
              )
            else
              const Text(
                  "Drinks data loading"), // Placeholder text while loading
          ],
        ),
      ),
    );
  }
}
