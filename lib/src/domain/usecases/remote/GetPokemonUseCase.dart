import 'package:whatibeendoing/src/core/resources/DataState.dart';
import '../../../data/model/pokemon_detail/PokemonDetail.dart';
import '../../repository/PokemonsRepository.dart';

class GetPokemonUseCase{
  final PokemonsRepository _pokemonsRepository;

  GetPokemonUseCase(this._pokemonsRepository);

  Future<DataState<PokemonDetail>> call(String pokemonName) {
    return _pokemonsRepository.getPokemon(pokemonName);
  }
}