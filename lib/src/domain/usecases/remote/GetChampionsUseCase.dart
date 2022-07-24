import 'package:whatibeendoing/src/data/util/Wrapper.dart';
import 'package:whatibeendoing/src/domain/repository/ChampionsRepository.dart';

import '../../../data/model/league/Champion.dart';

class GetChampionsUseCase {
  final ChampionsRepository _championsRepository;

  GetChampionsUseCase(this._championsRepository);

  Future<DataResult<List<Champion>>> call() async {
    var champions = await _championsRepository.getChampions();
    return champions;
  }
}