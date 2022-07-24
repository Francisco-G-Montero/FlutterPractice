import 'package:equatable/equatable.dart';

import '../../data/model/league/Champion.dart';

class LeagueStateModel extends Equatable {
  final List<Champion> championList;
  final bool loadingChampions;

  const LeagueStateModel({
    this.championList = const [],
    this.loadingChampions = true,
  });

  @override
  List<Object?> get props => [championList, loadingChampions];

  LeagueStateModel copyWith({
    List<Champion>? championList,
    bool? loadingChampions,
  }) {
    return LeagueStateModel(
      championList: championList ?? this.championList,
      loadingChampions: loadingChampions ?? this.loadingChampions,
    );
  }
}
