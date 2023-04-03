import 'package:flutter/material.dart';
import 'package:weather_app/components/glassComponent.dart';
import 'package:weather_app/components/hourlyWeatherCardComponent.dart';
import 'package:weather_app/models/hourlyWeather.dart';

class HourlyWeatherComponent extends StatelessWidget {
  final List<HourlyWeather> hourlyWeatherList;

  const HourlyWeatherComponent({
    required this.hourlyWeatherList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GlassComponent(
        height: MediaQuery.of(context).size.width / 3,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: LayoutBuilder(builder: (context, constraint) {
          return Container(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              itemBuilder: (context, index) => HourlyWeatherCardComponent(
                time: '${(hourlyWeatherList[index].time.hour != 12 ? hourlyWeatherList[index].time.hour % 12 : hourlyWeatherList[index].time.hour).toString().padLeft(2, '0')}:${hourlyWeatherList[index].time.minute.toString().padLeft(2, '0')} ${hourlyWeatherList[index].time.hour <= 12 ? 'a.m.' : 'p.m.'}',
                icon: hourlyWeatherList[index].icon,
                temperature: hourlyWeatherList[index].temperature.toString(),
                width: constraint.maxWidth / 3,
              ),
              itemCount: hourlyWeatherList.length,
            ),
          );
        }),
      ),
    );
  }
}
