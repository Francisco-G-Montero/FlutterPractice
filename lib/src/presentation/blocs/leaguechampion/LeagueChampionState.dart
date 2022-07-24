import 'package:equatable/equatable.dart';

import '../../../core/bloc/LeagueChampionStateModel.dart';

abstract class LeagueChampionState extends Equatable{

  const LeagueChampionState();

  @override
  List<Object?> get props => [];
}

class LeagueChampionLoading extends LeagueChampionState {
  const LeagueChampionLoading();
}

class LeagueChampionEditing extends LeagueChampionState {
  final LeagueChampionStateModel leagueChampionStateModel;

  const LeagueChampionEditing(this.leagueChampionStateModel);

  @override
  List<Object?> get props => [leagueChampionStateModel];
}

class LeagueChampionDone extends LeagueChampionState {
  const LeagueChampionDone();
}