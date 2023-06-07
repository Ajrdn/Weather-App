import 'package:flutter/material.dart';
import 'package:weather_app/components/currentWeatherComponent.dart';
import 'package:weather_app/components/weatherAppBarComponent.dart';
import 'package:weather_app/models/currentWeatherTitle.dart';
import 'package:weather_app/utils/data_utils.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:gap/gap.dart';

class CurrentWeatherScreen extends StatefulWidget {
  const CurrentWeatherScreen({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherScreen> createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  String? city;
  int? temperature;
  String? state;
  DateTime? now;
  List<CurrentWeatherTitle>? weatherTitleList;

  Future<void> refreshWeatherData() async {
    final data = await getWeatherData();

    setState(() {
      city = data!.currentWeather!.city;
      temperature = data!.currentWeather!.temperature;
      state = data!.currentWeather!.state;
      now = data!.currentWeather!.now;
      List<CurrentWeatherTitle> weatherTitleList = [
        CurrentWeatherTitle(
          title: 'Sunup',
          data: '${(data!.currentWeather!.sunup.hour != 12 ? data!.currentWeather!.sunup.hour % 12 : data!.currentWeather!.sunup.hour).toString().padLeft(2, '0')}:${data!.currentWeather!.sunup.minute.toString().padLeft(2, '0')}',
          unit: 'a.m.',
          icon: const BoxedIcon(
            WeatherIcons.sunrise,
            color: Colors.white70,
            size: 20.0,
          ),
        ),
        CurrentWeatherTitle(
          title: 'Sundown',
          data: '${(data!.currentWeather!.sundown.hour != 12 ? data!.currentWeather!.sundown.hour % 12 : data!.currentWeather!.sundown.hour).toString().padLeft(2, '0')}:${data!.currentWeather!.sundown.minute.toString().padLeft(2, '0')}',
          unit: 'p.m.',
          icon: const BoxedIcon(
            WeatherIcons.sunset,
            color: Colors.white70,
            size: 20.0,
          ),
        ),
        CurrentWeatherTitle(
          title: 'Wind Chill',
          data: '${data!.currentWeather!.windChill}',
          unit: '°C',
          icon: const BoxedIcon(
            WeatherIcons.thermometer_exterior,
            color: Colors.white70,
            size: 20.0,
          ),
        ),
        CurrentWeatherTitle(
          title: 'Visibility',
          data: data!.currentWeather!.visibility < 1000 ? '${data!.currentWeather!.visibility}m' : '${data!.currentWeather!.visibility % 1000 == 0 ? (data!.currentWeather!.visibility / 1000).round() : data!.currentWeather!.visibility / 1000}',
          unit: 'km',
          icon: const BoxedIcon(
            WeatherIcons.day_fog,
            color: Colors.white70,
            size: 20.0,
          ),
        ),
        CurrentWeatherTitle(
          title: 'Clouds',
          data: '${data!.currentWeather!.clouds}',
          unit: '%',
          icon: const BoxedIcon(
            WeatherIcons.cloud,
            color: Colors.white70,
            size: 20.0,
          ),
        ),
        CurrentWeatherTitle(
          title: 'Humidity',
          data: '${data!.currentWeather!.humidity}',
          unit: '%',
          icon: const BoxedIcon(
            WeatherIcons.raindrop,
            color: Colors.white70,
            size: 20.0,
          ),
        ),
        CurrentWeatherTitle(
          title: 'Pressure',
          data: '${data!.currentWeather!.pressure}',
          unit: 'hPa',
          icon: const BoxedIcon(
            WeatherIcons.barometer,
            color: Colors.white70,
            size: 20.0,
          ),
        ),
        CurrentWeatherTitle(
          title: 'Wind Speed',
          data: '${data!.currentWeather!.windSpeed}',
          unit: 'm/s',
          icon: const BoxedIcon(
            WeatherIcons.strong_wind,
            color: Colors.white70,
            size: 20.0,
          ),
        ),
      ];
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
          List<CurrentWeatherTitle> weatherTitleList = [
            CurrentWeatherTitle(
              title: 'Sunup',
              data: '${(data!.currentWeather!.sunup.hour != 12 ? data!.currentWeather!.sunup.hour % 12 : data!.currentWeather!.sunup.hour).toString().padLeft(2, '0')}:${data!.currentWeather!.sunup.minute.toString().padLeft(2, '0')}',
              unit: 'a.m.',
              icon: const BoxedIcon(
                WeatherIcons.sunrise,
                color: Colors.white70,
                size: 20.0,
              ),
            ),
            CurrentWeatherTitle(
              title: 'Sundown',
              data: '${(data!.currentWeather!.sundown.hour != 12 ? data!.currentWeather!.sundown.hour % 12 : data!.currentWeather!.sundown.hour).toString().padLeft(2, '0')}:${data!.currentWeather!.sundown.minute.toString().padLeft(2, '0')}',
              unit: 'p.m.',
              icon: const BoxedIcon(
                WeatherIcons.sunset,
                color: Colors.white70,
                size: 20.0,
              ),
            ),
            CurrentWeatherTitle(
              title: 'Wind Chill',
              data: '${data!.currentWeather!.windChill}',
              unit: '°C',
              icon: const BoxedIcon(
                WeatherIcons.thermometer_exterior,
                color: Colors.white70,
                size: 20.0,
              ),
            ),
            CurrentWeatherTitle(
              title: 'Visibility',
              data: data!.currentWeather!.visibility < 1000 ? '${data!.currentWeather!.visibility}m' : '${data!.currentWeather!.visibility % 1000 == 0 ? (data!.currentWeather!.visibility / 1000).round() : data!.currentWeather!.visibility / 1000}',
              unit: 'km',
              icon: const BoxedIcon(
                WeatherIcons.day_fog,
                color: Colors.white70,
                size: 20.0,
              ),
            ),
            CurrentWeatherTitle(
              title: 'Clouds',
              data: '${data!.currentWeather!.clouds}',
              unit: '%',
              icon: const BoxedIcon(
                WeatherIcons.cloud,
                color: Colors.white70,
                size: 20.0,
              ),
            ),
            CurrentWeatherTitle(
              title: 'Humidity',
              data: '${data!.currentWeather!.humidity}',
              unit: '%',
              icon: const BoxedIcon(
                WeatherIcons.raindrop,
                color: Colors.white70,
                size: 20.0,
              ),
            ),
            CurrentWeatherTitle(
              title: 'Pressure',
              data: '${data!.currentWeather!.pressure}',
              unit: 'hPa',
              icon: const BoxedIcon(
                WeatherIcons.barometer,
                color: Colors.white70,
                size: 20.0,
              ),
            ),
            CurrentWeatherTitle(
              title: 'Wind Speed',
              data: '${data!.currentWeather!.windSpeed}',
              unit: 'm/s',
              icon: const BoxedIcon(
                WeatherIcons.strong_wind,
                color: Colors.white70,
                size: 20.0,
              ),
            ),
          ];

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
                  CurrentWeatherComponent(
                    weatherTitleList: weatherTitleList!,
                  ),
                  const SliverGap(50),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
