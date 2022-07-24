class Location{
  final double lat;
  final double lng;

  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<dynamic, dynamic> json){
    return Location(lat: json['lat'], lng: json['lng']);
  }
}