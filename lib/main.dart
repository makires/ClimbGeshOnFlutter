import 'package:climb_gesh_on_flutter_demo/ui/guidbook-screen/climbing_area_model.dart';
import 'package:climb_gesh_on_flutter_demo/ui/guidbook-screen/elements/crag_details_widget.dart';
import 'package:flutter/material.dart';

import 'package:climb_gesh_on_flutter_demo/ui/guidbook-screen/elements/crags_screen.dart';
import 'package:climb_gesh_on_flutter_demo/ui/main_screen.dart';

import 'ui/guidbook-screen/elements/crag_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClimbGesh Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ru', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MainScreen(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case CragsListScreen.routeName:
            return MaterialPageRoute<ClimbingAreaModel>(
                settings: settings,
                builder: (context) {
                  return CragsListScreen(
                    area: settings.arguments as ClimbingAreaModel,
                  );
                });
          case CragDetailsWidget.routeName:
            return MaterialPageRoute<CragModel>(
                settings: settings,
                builder: (context) {
                  return CragDetailsWidget(
                    crag: settings.arguments as CragModel,
                  );
                });
        }
      },
      routes: {
        '/': (context) => const MainScreen(),
      },
    );
  }
}
