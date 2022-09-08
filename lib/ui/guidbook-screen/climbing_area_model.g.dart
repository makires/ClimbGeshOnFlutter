// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'climbing_area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClimbingAreaModel _$ClimbingAreaModelFromJson(Map<String, dynamic> json) =>
    ClimbingAreaModel(
      name: json['name'] as String,
      crags: (json['crags'] as List<dynamic>)
          .map((e) => CragModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      guidbookUrl: json['guidbookUrl'] as String,
      description: json['description'] as String,
      imageName: json['imageName'] as String,
    );

Map<String, dynamic> _$ClimbingAreaModelToJson(ClimbingAreaModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'crags': instance.crags.map((e) => e.toJson()).toList(),
      'guidbookUrl': instance.guidbookUrl,
      'description': instance.description,
      'imageName': instance.imageName,
    };

CragModel _$CragModelFromJson(Map<String, dynamic> json) => CragModel(
      name: json['name'] as String,
      imageName: json['imageName'] as String,
      imagesRoutes: (json['imagesRoutes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      routes: (json['routes'] as List<dynamic>)
          .map((e) => RouteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lat: json['lat'] as String,
      lon: json['lon'] as String,
    );

Map<String, dynamic> _$CragModelToJson(CragModel instance) => <String, dynamic>{
      'name': instance.name,
      'imageName': instance.imageName,
      'imagesRoutes': instance.imagesRoutes,
      'routes': instance.routes.map((e) => e.toJson()).toList(),
      'lat': instance.lat,
      'lon': instance.lon,
    };

RouteModel _$RouteModelFromJson(Map<String, dynamic> json) => RouteModel(
      name: json['name'] as String,
      grade: json['grade'] as String,
      bolts: json['bolts'] as String,
      number: json['number'] as int,
    );

Map<String, dynamic> _$RouteModelToJson(RouteModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'grade': instance.grade,
      'bolts': instance.bolts,
      'number': instance.number,
    };
