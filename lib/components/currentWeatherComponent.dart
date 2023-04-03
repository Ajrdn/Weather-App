import 'package:flutter/material.dart';
import 'package:weather_app/components/currentWeatherCardComponent.dart';
import 'package:weather_app/models/currentWeatherTitle.dart';

class CurrentWeatherComponent extends StatelessWidget {
  final List<CurrentWeatherTitle> weatherTitleList;

  const CurrentWeatherComponent({
    required this.weatherTitleList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => CurrentWeatherCardComponent(
          index: index,
          icon: weatherTitleList[index].icon,
          title: weatherTitleList[index].title,
          data: weatherTitleList[index].data,
          unit: weatherTitleList[index].unit,
        ),
        childCount: weatherTitleList.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 1.5,
      ),
    );
  }
}
