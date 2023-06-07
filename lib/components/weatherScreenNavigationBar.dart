import 'package:flutter/material.dart';

class WeatherScreenNavigationBar extends StatelessWidget {
  final ValueChanged<int> setIndex;
  final int index;

  const WeatherScreenNavigationBar({
    required this.setIndex,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(
            Icons.now_wallpaper,
            color: Colors.blue,
          ),
          label: '현재 날씨',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.settings_system_daydream,
            color: Colors.blue,
          ),
          label: '이후 날씨',
        ),
      ],
      selectedIndex: index,
      onDestinationSelected: setIndex,
      backgroundColor: Colors.white,
      indicatorColor: Colors.grey.withOpacity(0.3),
    );
  }
}
