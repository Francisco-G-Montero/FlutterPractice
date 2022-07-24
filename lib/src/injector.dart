import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:whatibeendoing/src/data/datasource/local/AppDatabase.dart';
import 'package:whatibeendoing/src/data/datasource/local/StoreService.dart';
import 'package:whatibeendoing/src/data/datasource/remote/FirestoreService.dart';
import 'package:whatibeendoing/src/data/datasource/remote/PokemonsApiService.dart';
import 'package:whatibeendoing/src/data/repository/ChampionsRepositoryImpl.dart';
import 'package:whatibeendoing/src/data/repository/DatabaseRepositoryImpl.dart';
import 'package:whatibeendoing/src/data/repository/LoginRepositoryImpl.dart';
import 'package:whatibeendoing/src/data/repository/PokemonsRepositoryImpl.dart';
import 'package:whatibeendoing/src/data/repository/StoreRepositoryImpl.dart';
import 'package:whatibeendoing/src/domain/repository/ChampionsRepository.dart';
import 'package:whatibeendoing/src/domain/repository/DatabaseRepository.dart';
import 'package:whatibeendoing/src/domain/repository/LoginRepository.dart';
import 'package:whatibeendoing/src/domain/repository/PokemonsRepository.dart';
import 'package:whatibeendoing/src/domain/repository/StoreRepository.dart';
import 'package:whatibeendoing/src/domain/usecases/local/DeleteAllPokemonsUseCase.dart';
import 'package:whatibeendoing/src/domain/usecases/local/GetAllPokemonsUsecase.dart';
import 'package:whatibeendoing/src/domain/usecases/local/InsertPokemonResultUseCase.dart';
import 'package:whatibeendoing/src/domain/usecases/remote/DeleteChampionUseCase.dart';
import 'package:whatibeendoing/src/domain/usecases/remote/GetChampionsUseCase.dart';
import 'package:whatibeendoing/src/domain/usecases/remote/GetPokemonUseCase.dart';
import 'package:whatibeendoing/src/domain/usecases/remote/GetPokemonsUseCase.dart';
import 'package:whatibeendoing/src/domain/usecases/local/GetStoreLoginDateUseCase.dart';
import 'package:whatibeendoing/src/domain/usecases/local/GetStoredTextUseCase.dart';
import 'package:whatibeendoing/src/domain/usecases/local/StoreLoginDateUseCase.dart';
import 'package:whatibeendoing/src/domain/usecases/local/StoreTextUseCase.dart';
import 'package:whatibeendoing/src/domain/usecases/remote/UpdateChampionUseCase.dart';
import 'package:whatibeendoing/src/presentation/blocs/league/LeagueBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/leaguechampion/LeagueChampionBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/login/LoginBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/remote_all_pokemons/RemoteAllPokemonsBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/remote_pokemon_details/PokemonBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/store_data/StoreBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/stores_map/StoresMapBloc.dart';

import 'config/utils/constants.dart';
import 'data/datasource/remote/RealtimeDatabaseService.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //local database
  final database = await $FloorAppDatabase.databaseBuilder(kDatabaseName).build();
  injector.registerSingleton<AppDatabase>(database);
  //dio retrofit
  injector.registerSingleton<Dio>(Dio());
  //services
  injector.registerSingleton<PokemonsApiService>(PokemonsApiService(injector()));
  injector.registerSingleton<StoreService>(StoreService());
  injector.registerSingleton<FirestoreService>(FirestoreService());
  injector.registerSingleton<RealtimeDatabaseService>(RealtimeDatabaseService());
  //repoimpl
  injector.registerSingleton<PokemonsRepository>(PokemonsRepositoryImpl(injector()));
  injector.registerSingleton<StoreRepository>(StoreRepositoryImpl(injector()));
  injector.registerSingleton<LoginRepository>(LoginRepositoryImpl());
  injector.registerSingleton<DatabaseRepository>(DatabaseRepositoryImpl(injector()));
  injector.registerSingleton<ChampionsRepository>(ChampionsRepositoryImpl(injector(),injector()));
  //usecases
  injector.registerSingleton<GetPokemonsUseCase>(GetPokemonsUseCase(injector()));
  injector.registerSingleton<GetPokemonUseCase>(GetPokemonUseCase(injector()));
  injector.registerSingleton<GetStoredTextUseCase>(GetStoredTextUseCase(injector()));
  injector.registerSingleton<StoreTextUseCase>(StoreTextUseCase(injector()));
  injector.registerSingleton<StoreLoginDateUseCase>(StoreLoginDateUseCase(injector()));
  injector
      .registerSingleton<GetStoreLoginDateUseCase>(GetStoreLoginDateUseCase(injector()));
  injector
      .registerSingleton<DeleteAllPokemonsUseCase>(DeleteAllPokemonsUseCase(injector()));
  injector.registerSingleton<GetAllPokemonsUsecase>(GetAllPokemonsUsecase(injector()));
  injector.registerSingleton<InsertPokemonResultUseCase>(
      InsertPokemonResultUseCase(injector()));
  injector.registerSingleton<GetChampionsUseCase>(GetChampionsUseCase(injector()));
  injector.registerSingleton<UpdateChampionUseCase>(UpdateChampionUseCase(injector()));
  injector.registerSingleton<DeleteChampionUseCase>(DeleteChampionUseCase(injector()));
  //blocs
  injector.registerFactory<RemoteAllPokemonsBloc>(() => RemoteAllPokemonsBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        //injector()
      ));
  injector.registerFactory<PokemonBloc>(() => PokemonBloc(injector()));
  injector.registerFactory<StoreBloc>(() => StoreBloc(injector(), injector()));
  injector.registerFactory<LoginBloc>(() => LoginBloc(injector(), injector()));
  injector.registerFactory<LeagueBloc>(() => LeagueBloc(injector(), injector()));
  injector.registerFactory<LeagueChampionBloc>(() => LeagueChampionBloc(injector()));
  injector.registerFactory<StoresMapBloc>(() => StoresMapBloc());
}
