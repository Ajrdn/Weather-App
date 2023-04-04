import 'package:weather_icons/weather_icons.dart';

class DailyWeather {
  final DateTime date;
  final BoxedIcon icon;
  final String description;
  final int minimumAirTemperature;
  final int maximumAirTemperature;

  DailyWeather({
    required this.date,
    required this.icon,
    required this.description,
    required this.minimumAirTemperature,
    required this.maximumAirTemperature,
  });
}