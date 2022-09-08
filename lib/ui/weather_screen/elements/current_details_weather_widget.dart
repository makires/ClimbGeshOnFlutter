import 'package:climb_gesh_on_flutter_demo/ui/weather_screen/weather_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentDetailsWeatherWidget extends StatelessWidget {
  const CurrentDetailsWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clouds =
        Provider.of<WeatherScreenViewModel>(context).weatherState.clouds;
    final windSpeed =
        Provider.of<WeatherScreenViewModel>(context).weatherState.windSpeed;
    final windGust =
        Provider.of<WeatherScreenViewModel>(context).weatherState.windGust;
    final windDeg =
        Provider.of<WeatherScreenViewModel>(context).weatherState.windDeg;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Облачность: $clouds'),
            Text('Скорость ветра: $windSpeed'),
            Text('Направление ветра: $windDeg'),
            Text('Порывы ветра до $windGust'),
          ],
        ),
      ],
    );
  }
}
