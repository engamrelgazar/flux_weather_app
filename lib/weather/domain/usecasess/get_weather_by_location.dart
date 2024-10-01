import 'package:flux_weather_app/weather/domain/entities/weather.dart';
import 'package:flux_weather_app/weather/domain/repository/base_weather_repository.dart';

class GetWeatherByLocation {
  final BaseWeatherRepository repository;

  GetWeatherByLocation({required this.repository});

  Future<Weather> execute(double lon, double lat) async {
    return await repository.getWeatherByLocation(lon, lat);
  }
}
