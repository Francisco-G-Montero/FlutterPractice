import '../entities/PokemonResultModel.dart';

abstract class DatabaseRepository {
  Future<List<PokemonResultModel>> getPokemonResults();
  Future<void> insertPokemonResult(PokemonResultModel pokemonResultModel);
  Future<void> deleteAllPokemonResult();
}