import 'package:whatibeendoing/src/domain/repository/DatabaseRepository.dart';

class DeleteAllPokemonsUseCase {
  final DatabaseRepository _databaseRepository;

  DeleteAllPokemonsUseCase(this._databaseRepository);

  Future<void> deleteAllPokemons() {
    return _databaseRepository.deleteAllPokemonResult();
  }
}
