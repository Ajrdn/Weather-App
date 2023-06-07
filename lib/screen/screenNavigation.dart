import 'package:flutter/material.dart';
import 'package:weather_app/components/weatherScreenNavigationBar.dart';
import 'package:weather_app/screen/currentWeatherScreen.dart';
import 'package:weather_app/screen/nextWeatherScreen.dart';

class ScreenNavigation extends StatefulWidget {
  const ScreenNavigation({Key? key}) : super(key: key);

  @override
  State<ScreenNavigation> createState() => _ScreenNavigationState();
}

class _ScreenNavigationState extends State<ScreenNavigation> {
  int index = 0;

  void setIndex(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const CurrentWeatherScreen(),
        const NextWeatherScreen(),
      ][index],
      bottomNavigationBar: WeatherScreenNavigationBar(
        setIndex: setIndex,
        index: index,
      ),
    );
  }
}
