/// location : {"lat":-34.8286232,"lng":-58.39333420000001}
/// viewport : {"northeast":{"lat":-34.80588149180424,"lng":-58.36200573429421},"southwest":{"lat":-34.85649103898515,"lng":-58.44106664632977}}

class Geometry {
  Geometry({
      Location? location, 
      Viewport? viewport,}){
    _location = location;
    _viewport = viewport;
}

  Geometry.fromJson(dynamic json) {
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _viewport = json['viewport'] != null ? Viewport.fromJson(json['viewport']) : null;
  }
  Location? _location;
  Viewport? _viewport;
Geometry copyWith({  Location? location,
  Viewport? viewport,
}) => Geometry(  location: location ?? _location,
  viewport: viewport ?? _viewport,
);
  Location? get location => _location;
  Viewport? get viewport => _viewport;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    if (_viewport != null) {
      map['viewport'] = _viewport?.toJson();
    }
    return map;
  }

}

/// northeast : {"lat":-34.80588149180424,"lng":-58.36200573429421}
/// southwest : {"lat":-34.85649103898515,"lng":-58.44106664632977}

class Viewport {
  Viewport({
      Northeast? northeast, 
      Southwest? southwest,}){
    _northeast = northeast;
    _southwest = southwest;
}

  Viewport.fromJson(dynamic json) {
    _northeast = json['northeast'] != null ? Northeast.fromJson(json['northeast']) : null;
    _southwest = json['southwest'] != null ? Southwest.fromJson(json['southwest']) : null;
  }
  Northeast? _northeast;
  Southwest? _southwest;
Viewport copyWith({  Northeast? northeast,
  Southwest? southwest,
}) => Viewport(  northeast: northeast ?? _northeast,
  southwest: southwest ?? _southwest,
);
  Northeast? get northeast => _northeast;
  Southwest? get southwest => _southwest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_northeast != null) {
      map['northeast'] = _northeast?.toJson();
    }
    if (_southwest != null) {
      map['southwest'] = _southwest?.toJson();
    }
    return map;
  }

}

/// lat : -34.85649103898515
/// lng : -58.44106664632977

class Southwest {
  Southwest({
      double? lat, 
      double? lng,}){
    _lat = lat;
    _lng = lng;
}

  Southwest.fromJson(dynamic json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }
  double? _lat;
  double? _lng;
Southwest copyWith({  double? lat,
  double? lng,
}) => Southwest(  lat: lat ?? _lat,
  lng: lng ?? _lng,
);
  double? get lat => _lat;
  double? get lng => _lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }

}

/// lat : -34.80588149180424
/// lng : -58.36200573429421

class Northeast {
  Northeast({
      double? lat, 
      double? lng,}){
    _lat = lat;
    _lng = lng;
}

  Northeast.fromJson(dynamic json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }
  double? _lat;
  double? _lng;
Northeast copyWith({  double? lat,
  double? lng,
}) => Northeast(  lat: lat ?? _lat,
  lng: lng ?? _lng,
);
  double? get lat => _lat;
  double? get lng => _lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }

}

/// lat : -34.8286232
/// lng : -58.39333420000001

class Location {
  Location({
      double? lat, 
      double? lng,}){
    _lat = lat;
    _lng = lng;
}

  Location.fromJson(dynamic json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }
  double? _lat;
  double? _lng;
Location copyWith({  double? lat,
  double? lng,
}) => Location(  lat: lat ?? _lat,
  lng: lng ?? _lng,
);
  double? get lat => _lat;
  double? get lng => _lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }

}