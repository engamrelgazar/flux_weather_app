import 'package:flux_weather_app/weather/domain/entities/weather.dart';

abstract class BaseWeatherRepository {
  Future<Weather> getWeatherByLocation(double lon, double lat);
}
