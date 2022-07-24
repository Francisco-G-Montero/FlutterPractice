import 'package:whatibeendoing/src/core/params/AllPokemonRequestParams.dart';
import 'package:whatibeendoing/src/core/resources/DataState.dart';

import '../../data/model/all_pokemons/PokemonResults.dart';
import '../../data/model/pokemon_detail/PokemonDetail.dart';

abstract class PokemonsRepository {
  Future<DataState<List<PokemonResult>>> getPokemons(
    AllPokemonRequestParams? params,
  );

  Future<DataState<PokemonDetail>> getPokemon(String pokemonName);
}
