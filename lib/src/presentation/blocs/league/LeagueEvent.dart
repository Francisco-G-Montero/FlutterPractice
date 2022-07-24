import 'package:equatable/equatable.dart';
import 'package:whatibeendoing/src/data/model/league/Champion.dart';

abstract class LeagueEvent extends Equatable {
  const LeagueEvent();

  @override
  List<Object?> get props => [];
}

class GetChampions extends LeagueEvent {
  const GetChampions();
}

class DeleteChampion extends LeagueEvent {
  final Champion champion;
  const DeleteChampion(this.champion);
}

class LeagueResetState extends LeagueEvent {
  const LeagueResetState();
}