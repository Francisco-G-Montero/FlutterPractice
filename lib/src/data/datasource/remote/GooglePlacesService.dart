import '../../model/places/Place.dart';
import '../../model/places/PlaceSearch.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const kilometer = 1000;

class GooglePlacesService {
  final key = "AIzaSyAWS_coYZKwGrw9O3SxWqATNrAcGZC7HiY";
  final radiusInKm = 200 * kilometer;

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    final url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=%28cities%29&components=ar&key=$key";
    final response = await http.get(Uri.parse(url));
    final json = convert.jsonDecode(response.body);
    final jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<Place> getPlace(String placeId) async {
    final url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";
    final response = await http.get(Uri.parse(url));
    final json = convert.jsonDecode(response.body);
    final jsonResult = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResult);
  }

  Future<Place> getPlaces(String type) async {
    final url = "https://maps.googleapis.com/maps/api/place/textsearch/json?type=$type&rankBy=distance&key=$key";
    return
  }
}