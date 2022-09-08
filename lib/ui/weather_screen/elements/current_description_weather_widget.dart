import 'package:climb_gesh_on_flutter_demo/ui/weather_screen/weather_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentDescriptionWeatherWidget extends StatelessWidget {
  const CurrentDescriptionWeatherWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final descriptionWeather = Provider.of<WeatherScreenViewModel>(context)
        .weatherState
        .descriptionWeather;
    final iconImageUrl =
        Provider.of<WeatherScreenViewModel>(context).weatherState.iconURL;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            descriptionWeather,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          width: 80,
          height: 80,
          child: iconImageUrl.isEmpty
              ? Text("--")
              : Image(
                  image: NetworkImage(iconImageUrl),
                ),
        )
      ],
    );
  }
}
