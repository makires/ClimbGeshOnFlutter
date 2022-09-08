import 'dart:math';

import 'package:climb_gesh_on_flutter_demo/ui/weather_screen/weather_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String currentTemperature =
        Provider.of<WeatherScreenViewModel>(context)
            .weatherState
            .currentTemperature;
    final sunrise =
        Provider.of<WeatherScreenViewModel>(context).weatherState.sunrise;
    final feelsLikeCurrentTemperature =
        Provider.of<WeatherScreenViewModel>(context)
            .weatherState
            .feelsLikeCurrentTemperature;
    final sunset =
        Provider.of<WeatherScreenViewModel>(context).weatherState.sunset;

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentTemperature,
              style: const TextStyle(fontSize: 40),
            ),
            Text(
              feelsLikeCurrentTemperature,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.wb_twilight,
                  size: 28,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  sunrise,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Transform.rotate(
                  angle: 180 * pi / 180,
                  child: const Icon(
                    Icons.wb_twilight,
                    size: 28,
                    semanticLabel: 'Sunset',
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  sunset,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
