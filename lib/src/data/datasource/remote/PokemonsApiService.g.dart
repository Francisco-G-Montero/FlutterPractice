// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PokemonsApiService.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PokemonsApiService implements PokemonsApiService {
  _PokemonsApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://pokeapi.co/api/v2/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<AllPokemons>> getAllPokemons(
      {limit = 1, offset = 1}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AllPokemons>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, 'pokemon?limit=${limit}&offset=${offset}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AllPokemons.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<PokemonDetail>> getPokemon({name = ""}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<PokemonDetail>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'pokemon/${name}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PokemonDetail.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
