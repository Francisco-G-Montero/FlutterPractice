import 'package:equatable/equatable.dart';

import '../../../core/bloc/StoresMapStates.dart';

class StoresMapState extends Equatable {
  const StoresMapState();

  @override
  List<Object?> get props => [];
}

class StoresMapLoading extends StoresMapState {
  const StoresMapLoading();
}

class StoresMapDone extends StoresMapState {
  StoresMapStates storesMapStates;

  StoresMapDone({this.storesMapStates = const StoresMapStates()});

  @override
  List<Object?> get props => [storesMapStates];

  StoresMapDone copyWith({
    StoresMapStates? storesMapStates,
  }) {
    return StoresMapDone(
      storesMapStates: storesMapStates ?? this.storesMapStates,
    );
  }
}

class StoresMapError extends StoresMapState {
  const StoresMapError();
}
