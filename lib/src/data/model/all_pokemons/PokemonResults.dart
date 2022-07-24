

import 'package:equatable/equatable.dart';

/// name : "bulbasaur"
/// url : "https://pokeapi.co/api/v2/pokemon/1/"

class PokemonResult extends Equatable {
  PokemonResult({
    String? name,
    String? url,}){
    _name = name;
    _url = url;
  }

  PokemonResult.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  String? _name;
  String? _url;
  PokemonResult copyWith({  String? name,
    String? url,
  }) => PokemonResult(  name: name ?? _name,
    url: url ?? _url,
  );
  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

  @override
  List<Object?> get props => [_name, _url, name, url];

}