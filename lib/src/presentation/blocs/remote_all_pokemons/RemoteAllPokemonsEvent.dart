import 'package:equatable/equatable.dart';

abstract class RemoteAllPokemonsEvent extends Equatable {
  const RemoteAllPokemonsEvent();

  @override
  List<Object?> get props => [];
}

class GetAllPokemons extends RemoteAllPokemonsEvent {
  const GetAllPokemons();
}
