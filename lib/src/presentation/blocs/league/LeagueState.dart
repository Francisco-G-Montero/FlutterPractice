import 'package:equatable/equatable.dart';

import '../../../core/bloc/LeagueStateModel.dart';

abstract class LeagueState extends Equatable{
  @override
  List<Object?> get props => [];

  const LeagueState();
}

class LeagueLoading extends LeagueState {
  const LeagueLoading();
}

class LeagueDone extends LeagueState {
  LeagueStateModel leagueStateModel;

  LeagueDone({this.leagueStateModel = const LeagueStateModel()});

  @override
  List<Object?> get props => [leagueStateModel];

  LeagueDone copyWith({
    LeagueStateModel? leagueStateModel,
  }) {
    return LeagueDone(
      leagueStateModel: leagueStateModel ?? this.leagueStateModel,
    );
  }
}

class LeagueError extends LeagueState {
  const LeagueError();
}