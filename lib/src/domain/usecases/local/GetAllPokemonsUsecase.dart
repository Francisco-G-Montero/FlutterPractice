import '../../entities/PokemonResultModel.dart';
import '../../repository/DatabaseRepository.dart';

class GetAllPokemonsUsecase {
  final DatabaseRepository _databaseRepository;

  GetAllPokemonsUsecase(this._databaseRepository);

  Future<List<PokemonResultModel>> getAllPokemons(){
    return _databaseRepository.getPokemonResults();
  }
}