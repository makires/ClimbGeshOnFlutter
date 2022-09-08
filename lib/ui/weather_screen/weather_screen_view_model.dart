import 'dart:async';

import 'package:climb_gesh_on_flutter_demo/model_area/weather_for_climbing_area_model.dart';
import 'package:climb_gesh_on_flutter_demo/model_weather/domain/weather_for_screen_model.dart';
import 'package:climb_gesh_on_flutter_demo/network/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class WeatherScreenViewModel extends ChangeNotifier {
  WeatherScreenViewModel() {
    checkInternet();
  }
  @override
  void dispose() {
    statusInternet.cancel();
    super.dispose();
  }

  void checkInternet() async {
    statusInternet =
        InternetConnectionChecker().onStatusChange.listen((statusOfInternet) {
      final hasInternet =
          statusOfInternet == InternetConnectionStatus.connected;
      if (hasInternet) {
        getCurrentWeatherFromNetwork();
      }
      this.hasInternet = hasInternet;
      notifyListeners();
    });
  }

  bool hasInternet = false;
  late StreamSubscription statusInternet;

  WeatherForClimbingArea weatherState = WeatherForClimbingArea();
  final WeatherService weatherService = WeatherService();

  void getCurrentWeatherFromNetwork() async {
    final weatherCurrent =
        await weatherService.getCurrentWeather(ClimbingAreaWeather.camels);
    if (weatherCurrent != null) {
      weatherState =
          WeatherForClimbingArea.createCurrentWeather(weatherCurrent);
    }
    notifyListeners();
  }

  void getForecastWeatherFromNetwork() async {
    final weatherForecast =
        await weatherService.getForecastWeather(ClimbingAreaWeather.camels);

    print('получили проогнох погоды' +
        weatherForecast.list[0].main.temp.toString());

    notifyListeners();
  }
}
