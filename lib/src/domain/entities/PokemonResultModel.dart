import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:whatibeendoing/src/config/utils/constants.dart';

@Entity(tableName: kPokemonListTableName)
class PokemonResultModel extends Equatable {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String name;
  final String url;

  PokemonResultModel({this.id, required this.name, required this.url});

  @override
  List<Object?> get props => [id, name, url];
}
