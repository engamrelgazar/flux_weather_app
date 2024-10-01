import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flux_weather_app/core/services/screenshot_service.dart';
import 'package:flux_weather_app/core/styles/app_colors.dart';
import 'package:flux_weather_app/weather/presentation/bloc/weather_bloc.dart';
import 'package:flux_weather_app/weather/presentation/widgets/custom_loading_indicator.dart';
import 'package:flux_weather_app/weather/presentation/widgets/weather_info_box.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  WeatherScreenState createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  final ScreenshotService _screenshotService = ScreenshotService();

  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(GetWeatherForLocationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _screenshotService.takeScreenshotAndShare,
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: Screenshot(
        controller: _screenshotService.screenshotController,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.secondaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              return _buildStateWidget(state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStateWidget(WeatherState state) {
    if (state is WeatherInitial) {
      return const CustomLoadingIndicator();
    } else if (state is WeatherLoaded) {
      return _buildWeatherContent(state);
    } else if (state is WeatherError) {
      return _buildErrorMessage(state.message);
    } else {
      return _buildErrorMessage("Unknown Error");
    }
  }

  Widget _buildWeatherContent(WeatherLoaded state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildCityName(state.weather.cityName),
        const SizedBox(height: 10),
        _buildWeatherIcon(state.weather.icon),
        _buildTemperature(state.weather.temperatureInCelsius),
        const SizedBox(height: 10),
        _buildDescription(state.weather.description),
        const SizedBox(height: 30),
        _buildWeatherInfoRow(state),
      ],
    );
  }

  Widget _buildCityName(String cityName) {
    return Text(
      cityName,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget _buildWeatherIcon(String icon) {
    return Image.network(
      'https://openweathermap.org/img/wn/$icon@2x.png',
    );
  }

  Widget _buildTemperature(double temperature) {
    return Text(
      '$temperature°C',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }

  Widget _buildWeatherInfoRow(WeatherLoaded state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        WeatherInfoBox(
          icon: Icons.air,
          label: 'Wind',
          value: '${state.weather.windSpeed} km/h',
        ),
        WeatherInfoBox(
          icon: Icons.water_drop,
          label: 'Humidity',
          value: '${state.weather.humidity}%',
        ),
        WeatherInfoBox(
          icon: Icons.compress,
          label: 'Pressure',
          value: '${state.weather.pressure} hPa',
        ),
      ],
    );
  }

  Widget _buildErrorMessage(String message) {
    return Center(
      child: Text(
        message,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
