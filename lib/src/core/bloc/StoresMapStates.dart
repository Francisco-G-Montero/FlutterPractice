import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:whatibeendoing/src/data/model/places/PlaceSearch.dart';

class StoresMapStates extends Equatable{
  final Position? currentLocation;
  final List<PlaceSearch> searchResults;

  const StoresMapStates({this.currentLocation, this.searchResults = const []});

  @override
  List<Object?> get props => [currentLocation, searchResults];

  StoresMapStates copyWith({
    Position? currentLocation,
    List<PlaceSearch>? searchResults,
  }) {
    return StoresMapStates(
      currentLocation: currentLocation ?? this.currentLocation,
      searchResults: searchResults ?? this.searchResults,
    );
  }
}