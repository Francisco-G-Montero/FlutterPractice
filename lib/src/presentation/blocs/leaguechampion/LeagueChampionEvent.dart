import 'package:equatable/equatable.dart';

import '../../../data/model/league/Champion.dart';

abstract class LeagueChampionEvent extends Equatable{

  const LeagueChampionEvent();

  @override
  List<Object?> get props => [];
}

class UpdateChampion extends LeagueChampionEvent{
  final Champion champion;
  const UpdateChampion(this.champion);
}

class EditMode extends LeagueChampionEvent{
  const EditMode();
}