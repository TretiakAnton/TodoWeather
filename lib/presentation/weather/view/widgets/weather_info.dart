import 'package:flutter/material.dart';
import 'package:todo_weather/domain/models/weather/weather_response.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({Key? key, required this.weather}) : super(key: key);
  final WeatherResponse weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Current weather is:'),
          const SizedBox(height: 10),
          Text(
            'Temperature is: ${weather.current.temp}°C, feels like ${weather.current.feelsLike}°C',
          ),
          const SizedBox(height: 20),
          Text(weather.daily.first.summary),

          ///could add more information if needed
        ],
      ),
    );
  }
}
