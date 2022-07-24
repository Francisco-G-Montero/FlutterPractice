import 'package:dio/dio.dart';
import 'package:whatibeendoing/src/core/params/AllPokemonRequestParams.dart';
import 'package:whatibeendoing/src/core/resources/DataState.dart';
import 'package:whatibeendoing/src/data/datasource/remote/PokemonsApiService.dart';
import 'package:whatibeendoing/src/domain/repository/PokemonsRepository.dart';

import '../model/all_pokemons/PokemonResults.dart';
import '../model/pokemon_detail/PokemonDetail.dart';

const int DEFAULT_VALUE = 20;

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsApiService _pokemonsApiService;

  PokemonsRepositoryImpl(this._pokemonsApiService);

  @override
  Future<DataState<List<PokemonResult>>> getPokemons(AllPokemonRequestParams? params) async {
    try {
      await Future.delayed(Duration(milliseconds: 10000));
      final httpResponse = await _pokemonsApiService.getAllPokemons(
          limit: params?.limit ?? DEFAULT_VALUE, offset: params?.offset ?? DEFAULT_VALUE);
      if (httpResponse.response.statusCode == 200) {
        return DataSuccess(httpResponse.data.results ?? []);
      }
      return DataError(DioError(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        requestOptions: httpResponse.response.requestOptions,
        type: DioErrorType.response,
      ));
    } on DioError catch (e) {
      return DataError(e);
    }
  }

  @override
  Future<DataState<PokemonDetail>> getPokemon(String pokemonName) async {
    try {
      final httpResponse = await _pokemonsApiService.getPokemon(name: pokemonName);
      if (httpResponse.response.statusCode == 200) {
        return DataSuccess(httpResponse.data);
      }
      return DataError(DioError(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        requestOptions: httpResponse.response.requestOptions,
        type: DioErrorType.response,
      ));
    } on DioError catch (e) {
      return DataError(e);
    }
  }
}
