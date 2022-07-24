import 'package:whatibeendoing/src/data/model/league/Champion.dart';
import 'package:whatibeendoing/src/data/util/Wrapper.dart';

import '../../repository/ChampionsRepository.dart';

class UpdateChampionUseCase {
  final ChampionsRepository _championsRepository;

  UpdateChampionUseCase(this._championsRepository);

  Future<DataResult<void>> call(Champion champion) async {
    return _championsRepository.updateChampion(champion);
  }
}
