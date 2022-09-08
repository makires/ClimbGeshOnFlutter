import 'package:json_annotation/json_annotation.dart';
part 'climbing_area_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ClimbingAreaModel {
  ClimbingAreaModel({
    required this.name,
    required this.crags,
    required this.guidbookUrl,
    required this.description,
    required this.imageName,
  });
  factory ClimbingAreaModel.fromJson(Map<String, dynamic> json) =>
      _$ClimbingAreaModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClimbingAreaModelToJson(this);
  String name;
  List<CragModel> crags;
  String guidbookUrl;
  String description;
  String imageName;

  int get countAllRoutes {
    if (crags.isEmpty) {
      return 0;
    } else {
      final arrayRoutes = crags.map((crag) => crag.routes.length);
      final allRoutes = arrayRoutes.reduce((value, element) => value + element);
      return allRoutes;
    }

    // return allRoutes;
  }
}

@JsonSerializable(explicitToJson: true)
class CragModel {
  CragModel({
    required this.name,
    required this.imageName,
    required this.imagesRoutes,
    required this.routes,
    required this.lat,
    required this.lon,
  });
  factory CragModel.fromJson(Map<String, dynamic> json) =>
      _$CragModelFromJson(json);
  Map<String, dynamic> toJson() => _$CragModelToJson(this);
  String name;
  String imageName;
  List<String> imagesRoutes;
  List<RouteModel> routes;
  String lat;
  String lon;
  List<RouteModel> get sortedRoutes {
    routes.sort(((a, b) => a.number.compareTo(b.number)));
    return routes;
  }
}

@JsonSerializable()
class RouteModel {
  RouteModel({
    required this.name,
    required this.grade,
    required this.bolts,
    required this.number,
  });
  factory RouteModel.fromJson(Map<String, dynamic> json) =>
      _$RouteModelFromJson(json);
  Map<String, dynamic> toJson() => _$RouteModelToJson(this);
  String name;
  String grade;
  String bolts;
  int number;
}
