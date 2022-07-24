import 'dart:async';
import 'package:whatibeendoing/src/core/params/AllPokemonRequestParams.dart';
import 'package:whatibeendoing/src/core/resources/DataResult.dart';
import 'package:whatibeendoing/src/core/resources/DataState.dart';
import 'package:whatibeendoing/src/domain/usecases/local/DeleteAllPokemonsUseCase.dart';
import 'package:whatibeendoing/src/domain/usecases/local/GetAllPokemonsUsecase.dart';
import 'package:whatibeendoing/src/domain/usecases/local/InsertPokemonResultUseCase.dart';
import 'package:whatibeendoing/src/domain/usecases/remote/GetPokemonsUseCase.dart';
import 'package:whatibeendoing/src/domain/usecases/local/GetStoreLoginDateUseCase.dart';
import 'package:whatibeendoing/src/presentation/blocs/remote_pokemon_details/PokemonState.dart';
import '../../../core/bloc/BlocWithState.dart';
import '../../../core/bloc/PokemonStates.dart';
import '../../../data/model/all_pokemons/PokemonResults.dart';
import 'RemoteAllPokemonsEvent.dart';
import 'RemoteAllPokemonsState.dart';

class RemoteAllPokemonsBloc extends BlocWithState<RemoteAllPokemonsEvent, RemoteAllPokemonsState> {
  final GetPokemonsUseCase _getPokemonsUseCase;
  final DeleteAllPokemonsUseCase _deleteAllPokemonsUseCase;
  final GetAllPokemonsUsecase _getAllPokemonsUsecase;
  final InsertPokemonResultUseCase _insertPokemonResultUseCase;

  //final GetStoreLoginDateUseCase _getStoreLoginDateUseCase;

  final List<PokemonResult> _allPokemons = [];
  int _page = 1;
  static const _pageSize = 10;

  RemoteAllPokemonsBloc(
      this._getPokemonsUseCase,
      //this._getStoreLoginDateUseCase,
      this._deleteAllPokemonsUseCase,
      this._getAllPokemonsUsecase,
      this._insertPokemonResultUseCase)
      : super(const RemoteAllPokemonsLoading()) {
    on<GetAllPokemons>(_getAllPokemons);
  }

  FutureOr<void> _getAllPokemons(event, emit) async {
    if (_allPokemons.isEmpty) {
      await getDatabasePokemons(emit);
    }
    DataState<List<PokemonResult>> dataState = await makeApiCall(emit);
    if (dataState is DataError) {
      emit(RemoteAllPokemonsError(error: dataState.error!));
      stateToIdle();
    }
  }

  Future<void> getDatabasePokemons(emit) async {
    final localPokemons = await _getAllPokemonsUsecase.getAllPokemons();
    emit(RemoteAllPokemonsDone(
        pokemonStates: PokemonStates(
            allLocalPokemons: localPokemons,
            switchToRemoteContent: false,
            appMessage: "Cargados los datos locales")));
  }

  Future<DataState<List<PokemonResult>>> makeApiCall(emit) async {
    stateToBusy();
    final dataState = await _getPokemonsUseCase(
      params: AllPokemonRequestParams(limit: _pageSize, offset: _page * _pageSize),
    );
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      if(_allPokemons.isEmpty){
        _deleteAllPokemonsUseCase.deleteAllPokemons();
      }
      final allPokemons = (_allPokemons) + dataState.data!;
      final noMoreData = (_allPokemons).length < _pageSize;
      _allPokemons.addAll(dataState.data!);
      emit(RemoteAllPokemonsDone(
          pokemonStates: PokemonStates(
              allApiPokemons: allPokemons,
              noMoreRemoteData: noMoreData,
              switchToRemoteContent: true,
              appMessage: "Cargados los datos de la api")));
      _page++;
      dataState.data!.forEach((pokemonResult) async {
        _insertPokemonResultUseCase.insertPokemon(pokemonResult);
      });
      stateToIdle();
    }
    return dataState;
  }
}
