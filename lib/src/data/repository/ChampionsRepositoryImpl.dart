import 'package:whatibeendoing/src/data/datasource/remote/FirestoreService.dart';
import 'package:whatibeendoing/src/data/model/league/Champion.dart';
import 'package:whatibeendoing/src/data/util/Wrapper.dart';

import '../../domain/repository/ChampionsRepository.dart';
import '../datasource/remote/RealtimeDatabaseService.dart';

class ChampionsRepositoryImpl implements ChampionsRepository {
  final FirestoreService _firestoreService;
  final RealtimeDatabaseService _realtimeDatabaseService;

  ChampionsRepositoryImpl(this._firestoreService, this._realtimeDatabaseService);

  @override
  Future<DataResult<List<Champion>>> getChampions() async {
    final champions = _realtimeDatabaseService
        .getChampions()
        .then((value) => DataResult.success(value))
        .onError((error, stackTrace) {
      print(error.toString()); //TODO MEJORAR
      return DataResult.failure(GenericFailure());
    });
    return champions;
  }

  @override
  Future<DataResult<void>> updateChampion(Champion champion) async {
    final result = _realtimeDatabaseService
        .updateChampion(champion)
        .then((value) => DataResult.success(null))
        .onError((error, stackTrace) => DataResult.failure(APIFailure()));
    return result;
  }

  @override
  Future<DataResult<void>> deleteChampion(Champion champion) async {
    final result = _realtimeDatabaseService
        .deleteChampion(champion)
        .then((value) => DataResult.success(null))
        .onError((error, stackTrace) => DataResult.failure(APIFailure()));
    return result;
  }
}
