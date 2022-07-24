import 'package:whatibeendoing/src/data/model/places/Geometry.dart';

class Place {
  final Geometry geometry;
  final String name;
  final String vecinity;

  const Place({
    required this.geometry,
    required this.name,
    required this.vecinity,
  });

  factory Place.fromJson(Map<dynamic, dynamic> json){
    return Place(
        geometry: Geometry.fromJson(json['geometry']),
        name: json['formatted_address'],
        vecinity: json['vicinity']
    );
  }
}