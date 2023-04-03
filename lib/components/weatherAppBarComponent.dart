import 'package:flutter/material.dart';

class WeatherAppBarComponent extends StatelessWidget {
  final String city;
  final int temperature;
  final String state;
  final DateTime now;

  const WeatherAppBarComponent({
    required this.city,
    required this.temperature,
    required this.state,
    required this.now,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        city,
        style: const TextStyle(
          fontSize: 25.0,
        ),
      ),
      expandedHeight: 235.0,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: kToolbarHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$temperature°',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 65.0,
                  ),
                ),
                Text(
                  state,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${(now.hour != 12 ? now.hour % 12 : now.hour).toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
