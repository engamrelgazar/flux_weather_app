import 'package:flux_weather_app/weather/data/datasources/remote_data_source.dart';
import 'package:flux_weather_app/weather/domain/entities/weather.dart';
import 'package:flux_weather_app/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  WeatherRepository({required this.baseRemoteDataSource});
  @override
  Future<Weather> getWeatherByLocation(double lon, double lat) async {
    return await baseRemoteDataSource.getWeatherByLocation(lon, lat);
  }
}
