import 'package:climb_gesh_on_flutter_demo/ui/weather_screen/weather_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentDateWidget extends StatelessWidget {
  const CurrentDateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentNameDay = Provider.of<WeatherScreenViewModel>(context)
        .weatherState
        .currentWeekday;
    final currentDate =
        Provider.of<WeatherScreenViewModel>(context).weatherState.currentDate;

    return Column(
      children: [
        Text(
          currentNameDay,
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          currentDate,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
