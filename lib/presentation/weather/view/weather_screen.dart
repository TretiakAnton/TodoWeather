import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_weather/core/bloc/bloc_states.dart';
import 'package:todo_weather/presentation/weather/bloc/weather_cubit.dart';
import 'package:todo_weather/presentation/weather/view/widgets/weather_info.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state.st == BlocStates.loading) {
            return _Loader();
          } else if (state.weather == null) {
            context.read<WeatherCubit>().getWeather();
            return _Loader();
          }
          return RefreshIndicator(
            onRefresh: () async {
              context.read<WeatherCubit>().getWeather();
            },
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: WeatherInfo(weather: state.weather!),
            ),
          );
        },
      ),
    );
  }
}

class _Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
