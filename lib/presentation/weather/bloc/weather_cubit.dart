import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:todo_weather/core/bloc/bloc_states.dart';
import 'package:todo_weather/data/repo/weather_repo.dart';
import 'package:todo_weather/domain/models/weather/latlon.dart';
import 'package:todo_weather/domain/models/weather/weather_response.dart';

part 'weather_cubit.g.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherState());

  final WeatherRepository _repository = WeatherRepository();

  getWeather() async {
    emit(state.copyWith(st: BlocStates.loading));
    final LatLon latLon = await _getCurrentLocation();
    final weather = await _repository.getWeather(latLon.lat, latLon.lon);
    emit(state.copyWith(st: BlocStates.completed, weather: weather));
  }

  Future<LatLon> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ///if no permission granted return hardcoded data for Kyiv
          return LatLon(lat: 50.450001, lon: 30.523333);
        }
      }
      final position = await Geolocator.getCurrentPosition();
      return LatLon(lat: position.latitude, lon: position.longitude);
    } catch (e) {
      return LatLon(lat: 50.450001, lon: 30.523333);
    }
  }
}
