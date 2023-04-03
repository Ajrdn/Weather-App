import 'package:flutter/material.dart';
import 'package:weather_app/components/glassComponent.dart';
import 'package:weather_app/components/dailyWeatherCardComponent.dart';
import 'package:weather_app/components/lineComponent.dart';
import 'package:weather_app/models/dailyWeather.dart';
import 'package:weather_app/utils/data_utils.dart';

class DailyWeatherComponent extends StatelessWidget {
  final List<DailyWeather> dailyWeatherList;

  const DailyWeatherComponent({
    required this.dailyWeatherList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GlassComponent(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => DailyWeatherCardComponent(
            day: getWeekdayName(dailyWeatherList[index].date.weekday),
            icon: dailyWeatherList[index].icon,
            description: dailyWeatherList[index].description,
            minimumAirTemperature: dailyWeatherList[index].minimumAirTemperature.toString(),
            maximumAirTemperature: dailyWeatherList[index].maximumAirTemperature.toString(),
          ),
          separatorBuilder: (context, index) => const LineComponent(),
          itemCount: dailyWeatherList.length,
        ),
      ),
    );
  }
}
