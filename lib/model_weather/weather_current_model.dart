import 'package:json_annotation/json_annotation.dart';

part 'weather_current_model.g.dart';

@JsonSerializable()
class WeatherCurrentModel {
  WeatherCurrentModel(
    this.weather,
    this.main,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
  );
  factory WeatherCurrentModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherCurrentModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherCurrentModelToJson(this);

  List<Weather> weather;
  Main main;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
}

@JsonSerializable()
class Clouds {
  Clouds(
    this.all,
  );
  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
  Map<String, dynamic> toJson() => _$CloudsToJson(this);
  int all;
}

@JsonSerializable()
class Main {
  Main(
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  );
  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);
  double temp;
  @JsonKey(name: 'feels_like')
  double feelsLike;
  @JsonKey(name: 'temp_min')
  double tempMin;
  @JsonKey(name: 'temp_max')
  double tempMax;
  int pressure;
  int humidity;
}

@JsonSerializable()
class Sys {
  Sys(
    this.sunrise,
    this.sunset,
  );
  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
  Map<String, dynamic> toJson() => _$SysToJson(this);
  int sunrise;
  int sunset;
}

@JsonSerializable()
class Weather {
  Weather(
    this.id,
    this.main,
    this.description,
    this.icon,
  );
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
  int id;
  String main;
  String description;
  String icon;
}

@JsonSerializable()
class Wind {
  Wind(
    this.speed,
    this.deg,
    this.gust,
  );
  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
  Map<String, dynamic> toJson() => _$WindToJson(this);
  double speed;
  int deg;
  double gust;
}
