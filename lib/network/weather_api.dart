class ApiOpenWeather {
  static String host = 'api.openweathermap.org';
  static String pathCurrentWeather = 'data/2.5/weather';
  static String pathForecastWeather = 'data/2.5/forecast';
  static String apiKey = 'c63d575559f1bebd1fa1940bda77a447';

  Map<String, dynamic> createParameters(String lat, String lon) {
    return {
      'lat': lat,
      'lon': lon,
      'appid': ApiOpenWeather.apiKey,
      'units': 'metric',
      'lang': 'ru'
    };
  }

  Uri createUrlFor(String path, Map<String, dynamic> parameters) {
    final url = Uri(
      scheme: 'https',
      host: ApiOpenWeather.host,
      path: path,
      queryParameters: parameters,
    );
    return url;
  }
}
