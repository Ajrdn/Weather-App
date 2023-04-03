import 'package:flutter/material.dart';
import 'package:weather_app/components/glassComponent.dart';
import 'package:weather_icons/weather_icons.dart';

class CurrentWeatherCardComponent extends StatelessWidget {
  final int index;
  final BoxedIcon icon;
  final String title;
  final String data;
  final String unit;

  const CurrentWeatherCardComponent({
    required this.index,
    required this.icon,
    required this.title,
    required this.data,
    required this.unit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassComponent(
      width: MediaQuery.of(context).size.width / 2,
      height: (MediaQuery.of(context).size.width / 2) * 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              SizedBox(width: index == 5 ? 7.5 : 10.0),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: index == 2
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Text(
                data,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 27.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: index == 2 ? 0.0 : 3.0),
              Text(
                unit,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: index == 2 ? 17.0 : 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
