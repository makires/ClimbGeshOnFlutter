import 'package:climb_gesh_on_flutter_demo/ui/profile_and_links/profile_and_links_screen.dart';
import 'package:climb_gesh_on_flutter_demo/ui/weather_screen/elements/current_date_widget.dart';
import 'package:climb_gesh_on_flutter_demo/ui/weather_screen/elements/current_description_weather_widget.dart';
import 'package:climb_gesh_on_flutter_demo/ui/weather_screen/elements/current_details_weather_widget.dart';
import 'package:climb_gesh_on_flutter_demo/ui/weather_screen/elements/current_weather_widget.dart';
import 'package:climb_gesh_on_flutter_demo/ui/weather_screen/weather_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherScreenWidget extends StatelessWidget {
  const WeatherScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => WeatherScreenViewModel()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Погода на Верблюдах'),
        ),
        body: const WeatherMainWidget(),
      ),
    );
  }
}

class WeatherMainWidget extends StatelessWidget {
  const WeatherMainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.grey,
          child: Provider.of<WeatherScreenViewModel>(context).hasInternet
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [
                      CurrentDateWidget(),
                      Divider(color: Colors.black),
                      CurrentWeatherWidget(),
                      Divider(),
                      CurrentDescriptionWeatherWidget(),
                      Divider(),
                      CurrentDetailsWeatherWidget(),
                    ],
                  ),
                )
              : Text(
                  "Для получения прогноза погоды приложению нужен доступ в интернет, проверьте вашии настройки"),
        ),
      ],
    );
  }
}
