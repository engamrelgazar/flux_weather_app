import 'package:dio/dio.dart';
import 'package:flux_weather_app/core/utils/constances.dart';
import 'package:flux_weather_app/weather/data/models/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel> getWeatherByLocation(double lon, double lat);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel> getWeatherByLocation(double lon, double lat) async {
    try {
      var response = await Dio().get(
          '${AppConstances.baseUrl}/weather?lat=$lat&lon=$lon&appid=25611a6c36c6a99ad4d1f24be04630e1');
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch weather data');
    }
  }
}
