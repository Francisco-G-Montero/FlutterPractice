import 'package:equatable/equatable.dart';

import '../../../core/bloc/StoreTextStatus.dart';

abstract class StoreState extends Equatable {
  final StoreTextStatus? storeTextStatus;
  final String? errorMessage;


  const StoreState({this.storeTextStatus, this.errorMessage});

  @override
  List<Object?> get props => [storeTextStatus, errorMessage];
}

class StoreLoading extends StoreState {
  const StoreLoading();
}

class StoreDone extends StoreState {
  const StoreDone(StoreTextStatus storeTextStatus) : super(storeTextStatus: storeTextStatus);
}

class StoreError extends StoreState {
  const StoreError(String errorMessage) : super(errorMessage: errorMessage);
}
