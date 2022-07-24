import 'package:floor/floor.dart';
import 'package:whatibeendoing/src/domain/entities/PokemonResultModel.dart';
import '../../../config/utils/constants.dart';

@dao
abstract class PokemonResultDao{
  @Query('SELECT * FROM $kPokemonListTableName')
  Future <List<PokemonResultModel>> getAllPokemons();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> inserPokemonResult(PokemonResultModel pokemonResultModel);

  @Query("DELETE FROM $kPokemonListTableName")
  Future<void> deleteAllPokemonResult();
}