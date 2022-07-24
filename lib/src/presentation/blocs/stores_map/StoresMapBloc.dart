import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:whatibeendoing/src/data/datasource/remote/GeolocationService.dart';
import 'package:whatibeendoing/src/data/datasource/remote/GooglePlacesService.dart';

import '../../../data/model/places/Place.dart';
import 'StoresMapEvent.dart';
import 'StoresMapState.dart';

class StoresMapBloc extends Bloc<StoresMapEvent, StoresMapState> {
  final GeolocationService _geolocationService = GeolocationService();
  final GooglePlacesService _googlePlacesService = GooglePlacesService();
  final StreamController<Place> selectedLocation = StreamController<Place>();

  StoresMapBloc() : super(const StoresMapLoading()) {
    on<InitializeMap>(_initializeMap);
    on<SearchAutocompletePlaces>(_searchPlaces);
    on<SetSelectedLocation>(_setSelectedLocation);
  }

  FutureOr<void> _initializeMap(event, emit) async {
    Position currentLocation = await _geolocationService.getCurrentLocation();
    final newState = StoresMapDone();
    newState.storesMapStates =
        newState.storesMapStates.copyWith(currentLocation: currentLocation);
    emit(newState);
  }

  FutureOr<void> _searchPlaces(event, emit) async {
    if(event is SearchAutocompletePlaces){
      final searchResult = await _googlePlacesService.getAutocomplete(event.search);
      if(state is StoresMapDone){
        final newState = StoresMapDone();
        newState.storesMapStates = (state as StoresMapDone).storesMapStates.copyWith(searchResults: searchResult);
        emit(newState);
      }
    }
  }

  FutureOr<void> _setSelectedLocation(event, emit) async {
    if(event is SetSelectedLocation){
     selectedLocation.add(await GooglePlacesService().getPlace(event.placeId));
     final newState = StoresMapDone();
     newState.storesMapStates = (state as StoresMapDone).storesMapStates.copyWith(searchResults: []);
     emit();
    }
  }

  dispose(){
    selectedLocation.close();
  }
}
