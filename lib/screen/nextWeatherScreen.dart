import 'package:flutter/material.dart';
import 'package:weather_app/components/currentWeatherComponent.dart';
import 'package:weather_app/components/hourlyWeatherComponent.dart';
import 'package:weather_app/components/dailyWeatherComponent.dart';
import 'package:weather_app/components/weatherAppBarComponent.dart';
import 'package:weather_app/models/currentWeatherTitle.dart';
import 'package:weather_app/models/dailyWeather.dart';
import 'package:weather_app/models/hourlyWeather.dart';
import 'package:weather_app/utils/data_utils.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:gap/gap.dart';

class NextWeatherScreen extends StatefulWidget {
  const NextWeatherScreen({Key? key}) : super(key: key);

  @override
  State<NextWeatherScreen> createState() => _NextWeatherScreenState();
}

class _NextWeatherScreenState extends State<NextWeatherScreen> {
  String? city;
  int? temperature;
  String? state;
  DateTime? now;
  List<HourlyWeather>? hourlyWeatherList;
  List<DailyWeather>? dailyWeatherList;

  Future<void> refreshWeatherData() async {
    final data = await getWeatherData();

    setState(() {
      city = data!.currentWeather!.city;
      temperature = data!.currentWeather!.temperature;
      state = data!.currentWeather!.state;
      now = data!.currentWeather!.now;
      hourlyWeatherList = data!.hourlyWeatherList;
      dailyWeatherList = data!.dailyWeatherList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getWeatherData(),
        builder: (context, snapshot) {
          if(!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if(snapshot.hasError)
            return Center(
              child: Text('에러가 발생하였습니다. 다시 시도해 주십시오.'),
            );

          final data = snapshot.data;

          city = data!.currentWeather!.city;
          temperature = data!.currentWeather!.temperature;
          state = data!.currentWeather!.state;
          now = data!.currentWeather!.now;
          hourlyWeatherList = data!.hourlyWeatherList;
          dailyWeatherList = data!.dailyWeatherList;

          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/sky.jpg'),
              ),
            ),
            child: RefreshIndicator(
              onRefresh: refreshWeatherData,
              child: CustomScrollView(
                slivers: [
                  WeatherAppBarComponent(
                    city: city!,
                    temperature: temperature!,
                    state: state!,
                    now: now!,
                  ),
                  HourlyWeatherComponent(
                    hourlyWeatherList: hourlyWeatherList!,
                  ),
                  const SliverGap(50),
                  DailyWeatherComponent(
                    dailyWeatherList: dailyWeatherList!,
                  ),
                  const SliverGap(30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
