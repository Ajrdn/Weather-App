import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class DailyWeatherCardComponent extends StatelessWidget {
  final String day;
  final BoxedIcon icon;
  final String description;
  final String minimumAirTemperature;
  final String maximumAirTemperature;

  const DailyWeatherCardComponent({
    required this.day,
    required this.icon,
    required this.description,
    required this.minimumAirTemperature,
    required this.maximumAirTemperature,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: Center(
            child: Text(
              day,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Center(
            child: icon,
          ),
        ),
        Flexible(
          flex: 2,
          child: Center(
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Text(
            '$minimumAirTemperature°C / $maximumAirTemperature°C',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
