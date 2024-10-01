import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_weather_app/core/styles/app_theme.dart';
import 'package:flux_weather_app/weather/data/datasources/remote_data_source.dart';
import 'package:flux_weather_app/weather/data/repository/weather_repository.dart';
import 'package:flux_weather_app/weather/domain/usecasess/get_weather_by_location.dart';
import 'package:flux_weather_app/weather/presentation/bloc/weather_bloc.dart';
import 'package:flux_weather_app/weather/presentation/weather_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
        GetWeatherByLocation(
          repository: WeatherRepository(remoteDataSource: RemoteDataSource()),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: AppTheme.lightTheme,
        home: const WeatherScreen(),
      ),
    );
  }
}
