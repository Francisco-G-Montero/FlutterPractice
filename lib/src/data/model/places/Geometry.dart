import 'Location.dart';

class Geometry {
  final Location location;

  Geometry({required this.location});

  factory Geometry.fromJson(Map<dynamic, dynamic> json) {
    return Geometry(location: Location.fromJson(json['location']));
  }
}
