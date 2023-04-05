import 'package:flutter/material.dart';
import 'package:weather_app/screen/weatherScreen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: WeatherScreen(),
      debugShowCheckedModeBanner: false,
    )
  );
}