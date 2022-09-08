import 'dart:convert';

import 'package:climb_gesh_on_flutter_demo/ui/guidbook-screen/climbing_area_model.dart';
import 'package:climb_gesh_on_flutter_demo/ui/guidbook-screen/elements/area_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class GuidBookScreenViewModel extends ChangeNotifier {
  GuidBookScreenViewModel() {
    readLocalClimbJson();
  }
  List<ClimbingAreaModel> areas = [];
  void readLocalClimbJson() async {
    final jsonAsString = await rootBundle.loadString('assets/climbgesh.json');
    final jsonAsListObjects = jsonDecode(jsonAsString) as List<dynamic>;
    final areas = jsonAsListObjects
        .map((element) => ClimbingAreaModel.fromJson(element))
        .toList();
    this.areas = areas;
    notifyListeners();
  }
}

class GuidBookScreen extends StatelessWidget {
  const GuidBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GuidBookScreenViewModel(),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Районы'),
            ),
            body: ListView(
              children: Provider.of<GuidBookScreenViewModel>(context)
                  .areas
                  .map((area) => AreaWidget(area: area))
                  .toList(),
            ),
          );
        });
  }
}
