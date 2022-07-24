import 'package:geolocator/geolocator.dart';

class GeolocationService {
  Future<Position> getCurrentLocation() async {
    return Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true,
        desiredAccuracy: LocationAccuracy.best,
    );
  }
}
