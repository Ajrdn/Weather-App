class CurrentWeather {
  final String city;
  final String state;
  final DateTime now;
  final DateTime sunup;
  final DateTime sundown;
  final int temperature;
  final int visibility;
  final int windChill;
  final int clouds;
  final int humidity;
  final int pressure;
  final int windSpeed;

  CurrentWeather({
    required this.city,
    required this.state,
    required this.now,
    required this.sunup,
    required this.sundown,
    required this.temperature,
    required this.visibility,
    required this.windChill,
    required this.clouds,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
  });
}