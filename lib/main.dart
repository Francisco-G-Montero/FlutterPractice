import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:whatibeendoing/src/config/routes/AppRoutes.dart';
import 'package:whatibeendoing/src/config/utils/constants.dart';
import 'package:whatibeendoing/src/injector.dart';
import 'package:whatibeendoing/src/presentation/blocs/league/LeagueBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/leaguechampion/LeagueChampionBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/login/LoginBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/login/LoginEvent.dart';
import 'package:whatibeendoing/src/presentation/blocs/remote_all_pokemons/RemoteAllPokemonsBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/remote_all_pokemons/RemoteAllPokemonsEvent.dart';
import 'package:whatibeendoing/src/presentation/blocs/remote_pokemon_details/PokemonBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/store_data/StoreBloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:whatibeendoing/src/presentation/blocs/stores_map/StoresMapBloc.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  //TODO investigar que es esto
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteAllPokemonsBloc>(
            create: (context) => injector()..add(GetAllPokemons())),
        BlocProvider<PokemonBloc>(
            create: (context) => injector()..add),
        BlocProvider<StoreBloc>(
            create: (context) => injector()..add),
        BlocProvider<LoginBloc>(
            create: (context) => injector()..add(AppStarted())),
        BlocProvider<LeagueBloc>(
            create: (context) => injector()..add),
        BlocProvider<LeagueChampionBloc>(
            create: (context) => injector()..add),
        BlocProvider<StoresMapBloc>(
            create: (context) => injector()..add),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitle,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''), // English, no country code
          Locale('es', ''), // Spanish, no country code
        ],
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        initialRoute: kLoginRoute,
      ),
    );
  }
}
