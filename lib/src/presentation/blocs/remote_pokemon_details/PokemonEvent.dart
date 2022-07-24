import 'package:equatable/equatable.dart';

class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object?> get props => [];
}

class GetPokemon extends PokemonEvent {
  final String pokemonName;
  const GetPokemon(this.pokemonName);
}

class CleanPokemon extends PokemonEvent {
  const CleanPokemon();
}