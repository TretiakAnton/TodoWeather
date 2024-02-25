import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_weather/core/constants.dart';
import 'package:todo_weather/domain/models/weather/weather_response.dart';

class WeatherRepository {
  Future<WeatherResponse> getWeather(double lat, double lon) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=minutely&units=metric&appid=$weatherApiKey');
    final response = await http.get(url);
    return WeatherResponse.fromJson(jsonDecode(response.body));
  }
}
