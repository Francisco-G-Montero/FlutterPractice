import 'package:whatibeendoing/src/data/model/league/Champion.dart';
import 'package:whatibeendoing/src/data/util/Wrapper.dart';
import 'package:whatibeendoing/src/domain/repository/ChampionsRepository.dart';

class DeleteChampionUseCase {
  final ChampionsRepository _championsRepository;

  DeleteChampionUseCase(this._championsRepository);

  Future<DataResult<void>> call(Champion champion){
    return _championsRepository.deleteChampion(champion);
  }
}