import 'package:weather_icons/weather_icons.dart';

class CurrentWeatherTitle {
  final String title;
  final String data;
  final String unit;
  final BoxedIcon icon;

  CurrentWeatherTitle({
    required this.title,
    required this.data,
    required this.unit,
    required this.icon,
  });
}