import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:whatibeendoing/src/config/utils/constants.dart';

import '../../model/all_pokemons/AllPokemons.dart';
import '../../model/pokemon_detail/PokemonDetail.dart';
part 'PokemonsApiService.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class PokemonsApiService {
  factory PokemonsApiService(Dio dio, {String baseUrl}) = _PokemonsApiService;

  @GET('pokemon?limit={limit}&offset={offset}')
  Future<HttpResponse<AllPokemons>> getAllPokemons({
    @Path("limit") int limit = 1,
    @Path("offset") int offset = 1,
  });

  @GET('pokemon/{name}')
  Future<HttpResponse<PokemonDetail>> getPokemon({
    @Path("name") String name = "",
  });
}
