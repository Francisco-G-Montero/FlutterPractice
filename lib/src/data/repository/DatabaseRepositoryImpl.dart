import 'package:whatibeendoing/src/data/datasource/local/AppDatabase.dart';
import '../../domain/entities/PokemonResultModel.dart';
import '../../domain/repository/DatabaseRepository.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<void> deleteAllPokemonResult() {
    return _appDatabase.pokemonResultDao.deleteAllPokemonResult();
  }

  @override
  Future<List<PokemonResultModel>> getPokemonResults() {
    return _appDatabase.pokemonResultDao.getAllPokemons();
  }

  @override
  Future<void> insertPokemonResult(PokemonResultModel pokemonResult) {
    return _appDatabase.pokemonResultDao.inserPokemonResult(pokemonResult);
  }
}
