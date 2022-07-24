import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/remote_pokemon_details/PokemonEvent.dart';
import 'package:whatibeendoing/src/presentation/blocs/remote_pokemon_details/PokemonState.dart';

import '../../../core/resources/DataState.dart';
import '../../../data/model/pokemon_detail/PokemonDetail.dart';
import '../../../domain/usecases/remote/GetPokemonUseCase.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState>{
  final GetPokemonUseCase _getPokemonUseCase;
  PokemonDetail _pokemonDetail = PokemonDetail();

  PokemonBloc(this._getPokemonUseCase) : super(const PokemonLoading()){
    on<GetPokemon>(_getPokemon);
    on<CleanPokemon>((event, emit) {
      emit(PokemonLoading());
    });
  }

  FutureOr<void> _getPokemon(event, emit) async {
    String name = '';
    if (event is GetPokemon) name = event.pokemonName;
    final dataState = await _getPokemonUseCase(name);
    if (dataState is DataSuccess && dataState.data != null) {
      final pokemon = dataState.data;
      _pokemonDetail = pokemon!;
      emit(PokemonDone(pokemon));
    }
    if (dataState is DataError) {
      emit(PokemonError(dataState.error!));
    }
  }
}