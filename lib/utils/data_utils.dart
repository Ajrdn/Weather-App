import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/constant/API_KEY.dart';
import 'package:weather_app/models/Location.dart';
import 'package:weather_app/models/weatherData.dart';
import 'package:weather_app/models/currentWeather.dart';
import 'package:weather_app/models/dailyWeather.dart';
import 'package:weather_app/models/hourlyWeather.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

Future<String> checkPermission() async {
  final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

  if(!isLocationEnabled) {
    return '위치 서비스를 활성화 해주세요.';
  }

  LocationPermission checkedPermission = await Geolocator.checkPermission();

  if(checkedPermission == LocationPermission.denied) {
    checkedPermission = await Geolocator.requestPermission();

    if(checkedPermission == LocationPermission.denied) {
      return '위치 권한을 허가해주세요.';
    }
  }

  if(checkedPermission == LocationPermission.deniedForever) {
    return '앱의 위치 권한을 설정에서 허가해주세요.';
  }

  return '위치 권한이 허가되었습니다.';
}

Future<Location> getLocationData() async {
  final snapshot = await checkPermission();

  Location location = const Location(
    latitude: 37.566535,
    longitude: 126.9779683,
  );

  if(snapshot == '위치 권한이 허가되었습니다.') {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    location = Location(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  return location;
}

Future<WeatherData> getWeatherData() async {
  Location location = await getLocationData();
  http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/onecall?appid=$API_KEY&exclude=minutely&units=metric&lon=${location.longitude}&lat=${location.latitude}'));
  WeatherData weatherData;
  if(response.statusCode == 200) {
    final parseData = jsonDecode(response.body);

    CurrentWeather currentWeather = CurrentWeather(
      city: parseData['timezone'].split('/')[1],
      state: parseData['current']['weather'][0]['main'],
      now: getCalculatedTime(
        time: parseData['current']['dt'],
        timezoneOffset: parseData['timezone_offset'],
      ),
      sunup: getCalculatedTime(
        time: parseData['current']['sunrise'],
        timezoneOffset: parseData['timezone_offset'],
      ),
      sundown: getCalculatedTime(
        time: parseData['current']['sunset'],
        timezoneOffset: parseData['timezone_offset'],
      ),
      temperature: parseData['current']['temp'].round(),
      visibility: parseData['current']['visibility'],
      windChill: parseData['current']['feels_like'].round(),
      clouds: parseData['current']['clouds'],
      humidity: parseData['current']['humidity'],
      pressure: parseData['current']['pressure'],
      windSpeed: parseData['current']['wind_speed'].round(),
    );

    List<HourlyWeather> hourlyWeatherList = [];
    for(int i = 0; i < 24; i++) {
      hourlyWeatherList.add(HourlyWeather(
        time: getCalculatedTime(
          time: parseData['hourly'][i]['dt'],
          timezoneOffset: parseData['timezone_offset'],
        ),
        icon: getWeatherIcon(parseData['hourly'][i]['weather'][0]['icon'].substring(0, 2), 35.0),
        temperature: parseData['hourly'][i]['temp'].round(),
      ));
    }

    List<DailyWeather> dailyWeatherList = [];
    for(int i = 1; i < 8; i++) {
      dailyWeatherList.add(DailyWeather(
        date: getCalculatedTime(
          time: parseData['daily'][i]['dt'],
          timezoneOffset: parseData['timezone_offset'],
        ),
        icon: getWeatherIcon(parseData['daily'][i]['weather'][0]['icon'].substring(0, 2), 25.0),
        description: parseData['daily'][i]['weather'][0]['description'],
        minimumAirTemperature: parseData['daily'][i]['temp']['min'].round(),
        maximumAirTemperature: parseData['daily'][i]['temp']['max'].round(),
      ));
    }

    weatherData = WeatherData(
      currentWeather: currentWeather,
      hourlyWeatherList: hourlyWeatherList,
      dailyWeatherList: dailyWeatherList,
    );
  } else {
    weatherData = const WeatherData(
      currentWeather: null,
      hourlyWeatherList: null,
      dailyWeatherList: null,
    );
  }

  return weatherData;
}

DateTime getCalculatedTime({
  required int time,
  required int timezoneOffset,
}) {
  return DateTime.fromMillisecondsSinceEpoch((time + timezoneOffset) * 1000);
}

BoxedIcon getWeatherIcon(String iconCode, double size) {
  IconData icon;

  if(iconCode == '01')
    icon = WeatherIcons.day_sunny;
  else if(iconCode == '02')
    icon = WeatherIcons.day_cloudy;
  else if(iconCode == '03')
    icon = WeatherIcons.cloudy;
  else if(iconCode == '04')
    icon = WeatherIcons.cloudy_windy;
  else if(iconCode == '09')
    icon = WeatherIcons.showers;
  else if(iconCode == '10')
    icon = WeatherIcons.rain;
  else if(iconCode == '11')
    icon = WeatherIcons.thunderstorm;
  else if(iconCode == '13')
    icon = WeatherIcons.snow;
  else if(iconCode == '50')
    icon = WeatherIcons.fog;
  else
    throw Exception('등록되지 않은 아이콘 입니다.');

  return BoxedIcon(
    icon,
    color: Colors.white70,
    size: size,
  );
}

String getWeekdayName(int weekday) {
  String weekdayName = '';

  if(weekday == 1) weekdayName = 'Mon';
  else if(weekday == 2) weekdayName = 'Tue';
  else if(weekday == 3) weekdayName = 'Wed';
  else if(weekday == 4) weekdayName = 'Thu';
  else if(weekday == 5) weekdayName = 'Fri';
  else if(weekday == 6) weekdayName = 'Sat';
  else weekdayName = 'Sun';

  return weekdayName;
}
