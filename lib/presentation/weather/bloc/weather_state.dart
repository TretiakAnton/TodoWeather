part of 'weather_cubit.dart';

@CopyWith()
class WeatherState {
  final BlocStates st;
  final WeatherResponse? weather;

  WeatherState({
    this.st = BlocStates.completed,
    this.weather,
  });
}
