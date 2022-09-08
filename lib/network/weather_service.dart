// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:climb_gesh_on_flutter_demo/model_area/weather_for_climbing_area_model.dart';
import 'package:climb_gesh_on_flutter_demo/model_weather/weather_current_model.dart';
import 'package:climb_gesh_on_flutter_demo/model_weather/weather_forecast_model.dart';
import 'package:climb_gesh_on_flutter_demo/network/weather_api.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final apiWeather = ApiOpenWeather();
// вариант использования встроенного в dart сетевого запроса
  final client = HttpClient();

  Future<WeatherCurrentModel?> getCurrentWeather(
      ClimbingAreaWeather area) async {
    // создаем url для текущей погоды
    final url = apiWeather.createUrlFor(
      ApiOpenWeather.pathCurrentWeather,
      apiWeather.createParameters(area.lat, area.lon),
    );
    // создаем http-соединение с методом GET
    try {
      final request = await client.getUrl(url);
// получаем response и закрываем соединение
      final response = await request.close();
      // TODO: вывести алерт пользователю если response.statusCode !=200
      // создаем единую строку
      final jsonStrings = await response.transform(utf8.decoder).toList();
      final jsonString = jsonStrings.join();
      // декодируем строку в словарь
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      final weatherCurrent = WeatherCurrentModel.fromJson(json);
      return weatherCurrent;
    } catch (e) {
      return null;
      // throw Exception('Не удалось загрузить погоду');
    }
  }

// вариант использования сетевого запроса с помощью библиотеки http
  Future<WeatherForecastModel> getForecastWeather(
      ClimbingAreaWeather area) async {
    print('получить прогноз погоды');

    final url = apiWeather.createUrlFor(ApiOpenWeather.pathForecastWeather,
        apiWeather.createParameters(area.lat, area.lon));
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return WeatherForecastModel.fromJson(jsonDecode(response.body));
    } else {
      // TODO: вывести алерт пользователю
      throw Exception('Не удалось загрузить погоду');
    }
  }
}
