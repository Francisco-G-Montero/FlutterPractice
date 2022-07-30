import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatibeendoing/src/presentation/blocs/stores_map/StoresMapBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/stores_map/StoresMapEvent.dart';

import '../../data/model/places/Place.dart';
import '../blocs/stores_map/StoresMapState.dart';

class StoresView extends StatefulWidget {
  @override
  State<StoresView> createState() => _StoresViewState();
}

class _StoresViewState extends State<StoresView> {
  late GoogleMapController mapController;
  final Completer<GoogleMapController> _mapController = Completer();
  late StreamSubscription locationSubscription;
  LatLng _myLocation = const LatLng(-34.9191509, -57.9710679);

  @override
  void initState() {
    final bloc = context.read<StoresMapBloc>();
    locationSubscription = bloc.selectedLocation.stream.listen((place) {
      if (place != null) {
        _goToPlace(place);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    context.read<StoresMapBloc>().dispose();
    locationSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<StoresMapBloc, StoresMapState>(builder: (_, state) {
      if (state is StoresMapLoading) {
        _.read<StoresMapBloc>().add(InitializeMap());
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is StoresMapDone) {
        if (state.storesMapStates.currentLocation != null) {
          _myLocation = LatLng(state.storesMapStates.currentLocation!.latitude,
              state.storesMapStates.currentLocation!.longitude);
        }
        return ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                  hintText: "Buscar locations", suffixIcon: Icon(Icons.search)),
              onChanged: (value) {
                if(value.length >3) {
                  context.read<StoresMapBloc>().add(SearchAutocompletePlaces(value));
                }
              },
            ),
          ),
          Stack(
            children: [
              Container(
                height: 300,
                child: GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: _myLocation,
                    zoom: 13,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _mapController.complete(controller);
                  },
                ),
              ),
              if (state.storesMapStates.searchResults.isNotEmpty)
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.6),
                    backgroundBlendMode: BlendMode.darken,
                  ),
                ),
              if (state.storesMapStates.searchResults.isNotEmpty)
                Container(
                  height: 300,
                  child: ListView.builder(
                      itemCount: state.storesMapStates.searchResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            state.storesMapStates.searchResults[index].description,
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            context.read<StoresMapBloc>().add(SetSelectedLocation(
                                state.storesMapStates.searchResults[index].placeId));
                          },
                        );
                      }),
                )
            ],
          ),
        ]);
      }
      return Center(
        child: Text("Algo inesperado ha ocurrido"),
      );
    });
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController mapController = await _mapController.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(place.geometry.location.lat, place.geometry.location.lng),
        zoom: 14)));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text("Google Maps ejemplo"),
      centerTitle: true,
      backgroundColor: Colors.redAccent,
    );
  }
}
