import 'package:flutter/material.dart';
import 'package:weather_app/screen/screenNavigation.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ScreenNavigation(),
      debugShowCheckedModeBanner: false,
    )
  );
}