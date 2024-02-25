// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WeatherStateCWProxy {
  WeatherState st(BlocStates st);

  WeatherState weather(WeatherResponse? weather);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeatherState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeatherState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeatherState call({
    BlocStates? st,
    WeatherResponse? weather,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWeatherState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWeatherState.copyWith.fieldName(...)`
class _$WeatherStateCWProxyImpl implements _$WeatherStateCWProxy {
  const _$WeatherStateCWProxyImpl(this._value);

  final WeatherState _value;

  @override
  WeatherState st(BlocStates st) => this(st: st);

  @override
  WeatherState weather(WeatherResponse? weather) => this(weather: weather);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeatherState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeatherState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeatherState call({
    Object? st = const $CopyWithPlaceholder(),
    Object? weather = const $CopyWithPlaceholder(),
  }) {
    return WeatherState(
      st: st == const $CopyWithPlaceholder() || st == null
          ? _value.st
          // ignore: cast_nullable_to_non_nullable
          : st as BlocStates,
      weather: weather == const $CopyWithPlaceholder()
          ? _value.weather
          // ignore: cast_nullable_to_non_nullable
          : weather as WeatherResponse?,
    );
  }
}

extension $WeatherStateCopyWith on WeatherState {
  /// Returns a callable class that can be used as follows: `instanceOfWeatherState.copyWith(...)` or like so:`instanceOfWeatherState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WeatherStateCWProxy get copyWith => _$WeatherStateCWProxyImpl(this);
}
