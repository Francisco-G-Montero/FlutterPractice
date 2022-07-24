import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'Champion.g.dart';

@JsonSerializable(explicitToJson: true)
class Champion extends Equatable {
  @JsonKey(ignore: true)
  String id;
  final String name;
  final String description;
  final String imageUrl;

  Champion({
    this.id = "",
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Champion.fromJson(Map<String, Object?> json) => _$ChampionFromJson(json);

  //se mejoro la serializacion para manejar el id (remover) del document
  Map<String, Object?> toJson() => _$ChampionToJson(this);

  Champion copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
  }) {
    return Champion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object?> get props => [id, name, description, imageUrl];

  //ODM firestore validators
  //...
}

@Collection<Champion>('champions')
final championsRef  = ChampionCollectionReference();
