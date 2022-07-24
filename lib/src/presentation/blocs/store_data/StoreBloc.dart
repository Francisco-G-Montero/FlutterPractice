import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatibeendoing/src/core/resources/DataResult.dart';
import 'package:whatibeendoing/src/domain/usecases/local/StoreTextUseCase.dart';
import 'package:whatibeendoing/src/presentation/blocs/store_data/StoreEvent.dart';
import 'package:whatibeendoing/src/presentation/blocs/store_data/StoreState.dart';

import '../../../core/bloc/StoreTextStatus.dart';
import '../../../domain/usecases/local/GetStoredTextUseCase.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final GetStoredTextUseCase _getStoredTextUseCase;
  final StoreTextUseCase _storeTextUseCase;
  StoreTextStatus storeTextStatus = StoreTextStatus();

  StoreBloc(this._getStoredTextUseCase, this._storeTextUseCase)
      : super(const StoreLoading()) {
    on<GetText>(_getText);
    on<SaveText>((event, emit) async {
      final dataResult = await _storeTextUseCase.storeText(event.saveText);
      print("save text $dataResult");
      if(dataResult is ResultSuccess){
        emit(StoreDone(storeTextStatus.copyWith(savedText: true)));
      }
    });
  }

  FutureOr<void> _getText(event, emit) async {
    emit(StoreDone(storeTextStatus.copyWith(loadingText: true)));
    final dataResult = await _getStoredTextUseCase.getStoredText();
    switch (dataResult.runtimeType) {
      case ResultSuccess<String>:
        emit(StoreDone(storeTextStatus.copyWith(loadedText: dataResult.data!)));
        break;
      case ResultError:
        break;
    }
  }
}
