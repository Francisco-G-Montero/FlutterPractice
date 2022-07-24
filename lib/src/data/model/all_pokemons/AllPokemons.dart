import 'package:equatable/equatable.dart';

import 'PokemonResults.dart';

/// count : 1126
/// next : "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20"
/// previous : null
/// results : [{"name":"bulbasaur","url":"https://pokeapi.co/api/v2/pokemon/1/"},{"name":"ivysaur","url":"https://pokeapi.co/api/v2/pokemon/2/"},{"name":"venusaur","url":"https://pokeapi.co/api/v2/pokemon/3/"},{"name":"charmander","url":"https://pokeapi.co/api/v2/pokemon/4/"},{"name":"charmeleon","url":"https://pokeapi.co/api/v2/pokemon/5/"},{"name":"charizard","url":"https://pokeapi.co/api/v2/pokemon/6/"},{"name":"squirtle","url":"https://pokeapi.co/api/v2/pokemon/7/"},{"name":"wartortle","url":"https://pokeapi.co/api/v2/pokemon/8/"},{"name":"blastoise","url":"https://pokeapi.co/api/v2/pokemon/9/"},{"name":"caterpie","url":"https://pokeapi.co/api/v2/pokemon/10/"},{"name":"metapod","url":"https://pokeapi.co/api/v2/pokemon/11/"},{"name":"butterfree","url":"https://pokeapi.co/api/v2/pokemon/12/"},{"name":"weedle","url":"https://pokeapi.co/api/v2/pokemon/13/"},{"name":"kakuna","url":"https://pokeapi.co/api/v2/pokemon/14/"},{"name":"beedrill","url":"https://pokeapi.co/api/v2/pokemon/15/"},{"name":"pidgey","url":"https://pokeapi.co/api/v2/pokemon/16/"},{"name":"pidgeotto","url":"https://pokeapi.co/api/v2/pokemon/17/"},{"name":"pidgeot","url":"https://pokeapi.co/api/v2/pokemon/18/"},{"name":"rattata","url":"https://pokeapi.co/api/v2/pokemon/19/"},{"name":"raticate","url":"https://pokeapi.co/api/v2/pokemon/20/"}]

class AllPokemons extends Equatable {
  AllPokemons({
    int? count,
    String? next,
    dynamic previous,
    List<PokemonResult>? results,
  }) {
    _count = count;
    _next = next;
    _previous = previous;
    _results = results;
  }

  AllPokemons.fromJson(dynamic json) {
    _count = json['count'];
    _next = json['next'];
    _previous = json['previous'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(PokemonResult.fromJson(v));
      });
    }
  }

  int? _count;
  String? _next;
  dynamic _previous;
  List<PokemonResult>? _results;

  AllPokemons copyWith({
    int? count,
    String? next,
    dynamic previous,
    List<PokemonResult>? results,
  }) =>
      AllPokemons(
        count: count ?? _count,
        next: next ?? _next,
        previous: previous ?? _previous,
        results: results ?? _results,
      );

  int? get count => _count;

  String? get next => _next;

  dynamic get previous => _previous;

  List<PokemonResult>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['next'] = _next;
    map['previous'] = _previous;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  List<Object?> get props => [count, next, previous, results, _count, _next, _previous, _results];
}
