import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/pokemon_detail/PokemonDetail.dart';

abstract class PokemonState extends Equatable {
  final PokemonDetail? pokemonDetail;
  final DioError? error;

  const PokemonState({this.pokemonDetail, this.error});

  @override
  List<Object?> get props => [pokemonDetail, error];
}

class PokemonLoading extends PokemonState {
  const PokemonLoading();
}

class PokemonDone extends PokemonState {
  const PokemonDone(PokemonDetail pokemonDetail) : super(pokemonDetail: pokemonDetail);
}

class PokemonError extends PokemonState {
  const PokemonError(DioError error) : super(error: error);
}