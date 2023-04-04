import 'package:weather_icons/weather_icons.dart';

class HourlyWeather {
  final DateTime time;
  final BoxedIcon icon;
  final int temperature;

  HourlyWeather({
    required this.time,
    required this.icon,
    required this.temperature,
  });
}