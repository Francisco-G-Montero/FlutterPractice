import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../core/bloc/PokemonStates.dart';
import '../../../data/model/all_pokemons/PokemonResults.dart';

abstract class RemoteAllPokemonsState extends Equatable {
  const RemoteAllPokemonsState();
}

class RemoteAllPokemonsLoading extends RemoteAllPokemonsState {
  const RemoteAllPokemonsLoading();

  @override
  List<Object?> get props => [];
}

class RemoteAllPokemonsDone extends RemoteAllPokemonsState {
  final PokemonStates pokemonStates;

  const RemoteAllPokemonsDone({required this.pokemonStates});

  @override
  List<Object?> get props => [pokemonStates];

  RemoteAllPokemonsDone copyWith({
    PokemonStates? allPokemons,
    bool? noMoreData,
  }) {
    return RemoteAllPokemonsDone(
      pokemonStates: allPokemons ?? this.pokemonStates,
    );
  }
}

class RemoteAllPokemonsError extends RemoteAllPokemonsState {
  final DioError? error;

  const RemoteAllPokemonsError({this.error});

  @override
  List<Object?> get props => [error];
}
