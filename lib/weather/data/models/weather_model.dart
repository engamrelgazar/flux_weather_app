import 'package:flux_weather_app/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.id,
    required super.cityName,
    required super.description,
    required super.pressure,
    required super.temperature,
    required super.windSpeed,
    required super.humidity,
    required super.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json["id"] ?? 0,
      cityName: json["name"] ?? "Unknown",
      description: json["weather"][0]["description"] ?? "No Description",
      pressure: json["main"]["pressure"] ?? 0,
      temperature: json["main"]["temp"]?.toDouble() ?? 0.0,
      windSpeed: json["wind"]["speed"]?.toDouble() ?? 0.0,
      humidity: json["main"]["humidity"] ?? 0,
      icon: json["weather"][0]["icon"] ?? "01d",
    );
  }
}
