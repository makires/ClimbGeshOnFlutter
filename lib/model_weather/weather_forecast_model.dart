import 'package:json_annotation/json_annotation.dart';
part 'weather_forecast_model.g.dart';

// Данная модель не используется в приложении и расчитана на дальнейшее
// развитие проекта -
// здесь находится модель для 5-ти дневного прогноза

@JsonSerializable(explicitToJson: true)
class WeatherForecastModel {
  WeatherForecastModel(
    this.list,
    this.city,
  );

  List<Details> list;
  City city;

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherForecastModelToJson(this);
}

@JsonSerializable()
class City {
  City(
    this.name,
    this.sunrise,
    this.sunset,
  );

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
  String name;
  int sunrise;
  int sunset;
}

@JsonSerializable(explicitToJson: true)
class Details {
  Details(
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.pop,
    this.sys,
    this.dtTxt,
  );
  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsToJson(this);
  int dt;
  Main main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  double pop;
  Sys sys;
  @JsonKey(name: 'dt_txt')
  DateTime dtTxt;
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
    this.seaLevel,
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
  @JsonKey(name: 'sea_level')
  int seaLevel;
  int humidity;
}

@JsonSerializable()
class Sys {
  Sys(
    this.pod,
  );
  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
  Map<String, dynamic> toJson() => _$SysToJson(this);
  String pod;
}

@JsonSerializable(explicitToJson: true)
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
