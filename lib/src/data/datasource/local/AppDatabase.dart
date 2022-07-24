import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:whatibeendoing/src/data/datasource/local/PokemonResultDao.dart';
import 'package:whatibeendoing/src/domain/entities/PokemonResultModel.dart';

part 'AppDatabase.g.dart';

@Database(version: 1, entities: [PokemonResultModel])
abstract class AppDatabase extends FloorDatabase{
  PokemonResultDao get pokemonResultDao;
}