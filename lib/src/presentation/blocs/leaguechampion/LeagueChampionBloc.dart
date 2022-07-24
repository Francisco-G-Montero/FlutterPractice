import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatibeendoing/src/core/bloc/LeagueChampionStateModel.dart';
import 'package:whatibeendoing/src/domain/usecases/remote/UpdateChampionUseCase.dart';
import 'package:whatibeendoing/src/presentation/blocs/leaguechampion/LeagueChampionEvent.dart';
import 'package:whatibeendoing/src/presentation/blocs/leaguechampion/LeagueChampionState.dart';

class LeagueChampionBloc extends Bloc<LeagueChampionEvent, LeagueChampionState> {
  final UpdateChampionUseCase _updateChampionUseCase;
  final LeagueChampionStateModel _leagueChampionStateModel = LeagueChampionStateModel();

  LeagueChampionBloc(this._updateChampionUseCase) : super(const LeagueChampionLoading()) {
    on<EditMode>(_editMode);
    on<UpdateChampion>(_updateChampion);
  }

  FutureOr<void> _editMode(event, emit) async {
    emit(LeagueChampionEditing(_leagueChampionStateModel.copyWith()));
  }

  FutureOr<void> _updateChampion(event, emit) async {
    emit(LeagueChampionEditing(_leagueChampionStateModel.copyWith(
        isLoading: true, message: "Actualizando campeón, por favor, aguarde.")));
    final champion = (event as UpdateChampion).champion;
    final dataResult = await _updateChampionUseCase(champion);
    dataResult.fold((error) {
      LeagueChampionEditing(_leagueChampionStateModel);
    }, (data) {
      emit(LeagueChampionDone());
    });
  }
}
