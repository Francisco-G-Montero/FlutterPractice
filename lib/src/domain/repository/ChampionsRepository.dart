import 'package:whatibeendoing/src/data/model/league/Champion.dart';
import 'package:whatibeendoing/src/data/util/Wrapper.dart';

abstract class ChampionsRepository {
  Future<DataResult<List<Champion>>> getChampions();
  Future<DataResult<void>> updateChampion(Champion champion);
  Future<DataResult<void>> deleteChampion(Champion champion);
}