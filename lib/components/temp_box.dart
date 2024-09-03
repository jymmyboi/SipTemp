import 'package:flutter/material.dart';
import 'package:siptemp/models/weather_model.dart';

class TempBox extends StatelessWidget {
  const TempBox({
    super.key,
    required Weather? weather,
  }) : _weather = weather;

  final Weather? _weather;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: Container(
        width: double.infinity,
        color: Color.fromARGB(255, 178, 223, 219),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                _weather?.cityName ?? "City loading",
                style: const TextStyle(color: Color.fromARGB(255, 33, 33, 33)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                "${_weather?.temperature.round()}°C",
                style: const TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(255, 33, 33, 33),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
