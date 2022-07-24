import '../../../data/model/all_pokemons/PokemonResults.dart';
import '../../entities/PokemonResultModel.dart';
import '../../repository/DatabaseRepository.dart';

class InsertPokemonResultUseCase{
  final DatabaseRepository _databaseRepository;

  InsertPokemonResultUseCase(this._databaseRepository);

  Future<void> insertPokemon(PokemonResult pokemonResult){
    final pokemonResultModel = PokemonResultModel(name: pokemonResult.name!, url: pokemonResult.url!);
    return _databaseRepository.insertPokemonResult(pokemonResultModel);
  }
}