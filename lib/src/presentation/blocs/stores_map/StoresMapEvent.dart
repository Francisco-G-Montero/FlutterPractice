import 'package:equatable/equatable.dart';

class StoresMapEvent extends Equatable{
  const StoresMapEvent();

  @override
  List<Object?> get props => [];
}

class InitializeMap extends StoresMapEvent{
  const InitializeMap();
}

class SearchAutocompletePlaces extends StoresMapEvent{
  final String search;
  const SearchAutocompletePlaces(this.search);
}

class SetSelectedLocation extends StoresMapEvent{
  final String placeId;
  const SetSelectedLocation(this.placeId);
}