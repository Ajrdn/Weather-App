import 'package:weather_app/models/currentWeather.dart';
import 'package:weather_app/models/dailyWeather.dart';
import 'package:weather_app/models/hourlyWeather.dart';

class WeatherData {
  final CurrentWeather? currentWeather;
  final List<HourlyWeather>? hourlyWeatherList;
  final List<DailyWeather>? dailyWeatherList;

  const WeatherData({
    required this.currentWeather,
    required this.hourlyWeatherList,
    required this.dailyWeatherList,
  });
}