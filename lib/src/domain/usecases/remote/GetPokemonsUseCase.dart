import 'package:whatibeendoing/src/core/params/AllPokemonRequestParams.dart';
import 'package:whatibeendoing/src/core/resources/DataState.dart';
import 'package:whatibeendoing/src/core/usecases/UseCase.dart';
import 'package:whatibeendoing/src/domain/repository/PokemonsRepository.dart';

import '../../../data/model/all_pokemons/PokemonResults.dart';

class GetPokemonsUseCase implements UseCase<DataState<List<PokemonResult>>, AllPokemonRequestParams> {
  final PokemonsRepository _pokemonsRepository;

  GetPokemonsUseCase(this._pokemonsRepository);

  @override
  Future<DataState<List<PokemonResult>>> call({required AllPokemonRequestParams params}) {
    return _pokemonsRepository.getPokemons(params);
  }
}