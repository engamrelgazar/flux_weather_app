import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flux_weather_app/weather/domain/entities/weather.dart';
import 'package:flux_weather_app/weather/domain/usecasess/get_current_loaction.dart';
import 'package:flux_weather_app/weather/domain/usecasess/get_weather_by_location.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherByLocation getWeatherByLocation;
  final GetCurrentLocation _getCurrentLocation = GetCurrentLocation();

  WeatherBloc(this.getWeatherByLocation) : super(WeatherInitial()) {
    on<GetWeatherForLocationEvent>(_onGetWeatherForLocation);
  }

  Future<void> _onGetWeatherForLocation(
      GetWeatherForLocationEvent event, Emitter<WeatherState> emit) async {
    try {
      await _loadFromApi(emit);
    } catch (e) {
      emit(WeatherError('Failed to fetch data from API : ${e.toString()}'));
    }
  }

  Future<void> _loadFromApi(Emitter<WeatherState> emit) async {
    Position position = await _getCurrentLocation.call();
    Weather weather = await getWeatherByLocation.execute(
        position.longitude, position.latitude);
    emit(WeatherLoaded(weather));
  }
}
