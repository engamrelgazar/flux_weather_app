class Weather {
  final int _id;
  final String _cityName;
  final String _description;
  final int _pressure;
  final double _temperature;
  final double _windSpeed;
  final int _humidity;
  final String _icon;

  Weather({
    required int id,
    required String cityName,
    required String description,
    required int pressure,
    required double temperature,
    required double windSpeed,
    required int humidity,
    required String icon,
  })  : _id = id,
        _cityName = cityName,
        _description = description,
        _pressure = pressure,
        _temperature = temperature,
        _windSpeed = windSpeed,
        _humidity = humidity,
        _icon = icon;

  int get id => _id;
  String get cityName => _cityName;
  String get description => _description;
  int get pressure => _pressure;
  double get temperature => _temperature;
  double get windSpeed => _windSpeed;
  int get humidity => _humidity;
  String get icon => _icon;

  double get temperatureInCelsius =>
      double.parse((_temperature - 273.15).toStringAsFixed(1));

  String getWeatherSummary() {
    return 'Weather in $_cityName: $_description, Temperature: ${temperatureInCelsius.toStringAsFixed(1)}°C';
  }
}
