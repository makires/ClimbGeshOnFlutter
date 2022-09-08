// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:climb_gesh_on_flutter_demo/model_weather/weather_current_model.dart';
import 'package:climb_gesh_on_flutter_demo/utility/formatters_helper.dart';

class WeatherForClimbingArea {
  String currentWeekday;
  String currentDate;
  String currentTemperature;
  String feelsLikeCurrentTemperature;
  String sunset;
  String sunrise;
  String descriptionWeather;
  String iconURL;
  String clouds;
  String windSpeed;
  String windGust;
  String windDeg;

  WeatherForClimbingArea({
    this.currentWeekday = '',
    this.currentDate = '',
    this.currentTemperature = '',
    this.feelsLikeCurrentTemperature = '',
    this.sunset = '',
    this.sunrise = '',
    this.descriptionWeather = '',
    this.iconURL = '',
    this.clouds = '',
    this.windSpeed = '',
    this.windGust = '',
    this.windDeg = '',
  });

  factory WeatherForClimbingArea.createCurrentWeather(
      WeatherCurrentModel weather) {
    final currentWeekday = Formatters.weekdayFrom(weather.dt);
    final currentDate = Formatters.currentDate(weather.dt);
    final currentTemperature = '${weather.main.temp.round()} ºC';
    final feelsLikeCurrentTemperature =
        'Ощущается как ${weather.main.feelsLike.round()} ºC';
    final sunset = Formatters.sunset(weather.sys.sunset);
    final sunrise = Formatters.sunset(weather.sys.sunrise);
    final descriptionWeather = weather.weather[0].description;
    final iconURL =
        'https://openweathermap.org/img/wn/${weather.weather[0].icon}@2x.png';
    final clouds = '${weather.clouds.all} %';
    final windSpeed = '${weather.wind.speed} м/с';
    final windGust = '${weather.wind.gust} м/с';
    final windDeg = '${weather.wind.deg} º';

    return WeatherForClimbingArea(
      currentWeekday: currentWeekday,
      currentDate: currentDate,
      currentTemperature: currentTemperature,
      feelsLikeCurrentTemperature: feelsLikeCurrentTemperature,
      sunset: sunset,
      sunrise: sunrise,
      descriptionWeather: descriptionWeather,
      iconURL: iconURL,
      clouds: clouds,
      windSpeed: windSpeed,
      windGust: windGust,
      windDeg: windDeg,
    );
  }
}
