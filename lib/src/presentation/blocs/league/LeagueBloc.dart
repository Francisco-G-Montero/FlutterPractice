import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatibeendoing/src/core/bloc/LeagueStateModel.dart';
import 'package:whatibeendoing/src/data/model/league/Champion.dart';
import 'package:whatibeendoing/src/data/util/Wrapper.dart';
import 'package:whatibeendoing/src/domain/usecases/remote/DeleteChampionUseCase.dart';
import 'package:whatibeendoing/src/domain/usecases/remote/GetChampionsUseCase.dart';

import 'LeagueEvent.dart';
import 'LeagueState.dart';

class LeagueBloc extends Bloc<LeagueEvent, LeagueState> {
  final GetChampionsUseCase _getChampionsUseCase;
  final DeleteChampionUseCase _deleteChampionUseCase;

  LeagueBloc(this._getChampionsUseCase, this._deleteChampionUseCase)
      : super(const LeagueLoading()) {
    on<LeagueResetState>(_resetState);
    on<DeleteChampion>(_deleteChampion);
    on<GetChampions>(_getChampions);
  }

  FutureOr<void> _resetState(event, emit) async {
    emit(LeagueLoading());
  }

  FutureOr<void> _deleteChampion(event, emit) async {
    final champion = (event as DeleteChampion).champion;
    final dataResult = await _deleteChampionUseCase(champion);
    dataResult.fold((error) => null, (data) {
      emit(LeagueLoading());
    });
  }

  FutureOr<void> _getChampions(event, emit) async {
    final dataResult = await _getChampionsUseCase();
    dataResult.either((error) {
      emit(LeagueError()); //TODO MEJORAR
      return GenericFailure();
    }, (champions) {
      final newState = LeagueDone();
      newState.leagueStateModel = newState.leagueStateModel
          .copyWith(championList: champions, loadingChampions: false);
      emit(newState);
    });
  }
}
