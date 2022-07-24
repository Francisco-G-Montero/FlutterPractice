import 'package:equatable/equatable.dart';
import 'package:whatibeendoing/src/domain/entities/PokemonResultModel.dart';

import '../../data/model/all_pokemons/PokemonResults.dart';

class PokemonStates extends Equatable{
  final List<PokemonResult> allApiPokemons;
  final List<PokemonResultModel> allLocalPokemons;
  final String appMessage;
  final bool noMoreRemoteData;
  final bool switchToRemoteContent;

  PokemonStates({
    this.allApiPokemons = const [],
    this.allLocalPokemons = const [],
    this.appMessage = "",
    this.noMoreRemoteData = false,
    this.switchToRemoteContent = false,
  });

  @override
  List<Object?> get props => [allApiPokemons, allLocalPokemons, appMessage, noMoreRemoteData, switchToRemoteContent];
}