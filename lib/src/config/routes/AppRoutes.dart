import 'package:flutter/material.dart';
import 'package:whatibeendoing/src/presentation/views/LeagueView.dart';
import 'package:whatibeendoing/src/presentation/views/LoginView.dart';
import 'package:whatibeendoing/src/presentation/views/PokemonDetailView.dart';
import 'package:whatibeendoing/src/presentation/views/StoreDataView.dart';

import '../../data/model/league/Champion.dart';
import '../../presentation/views/HomeView.dart';
import '../../presentation/views/LeagueChampionView.dart';
import '../../presentation/views/StoresView.dart';
import '../utils/constants.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case kLoginRoute:
        return _materialRoute(LoginView());
      case kRouteHome:
        return _materialRoute(const HomeView());
      case kRoutePokemonDetailView:
        if (arguments is String) {
          return _materialRoute(PokemonDetailView(arguments));
        }
        break;
      case kStoreDataView:
        return _materialRoute(StoreDataView());
      case kLeagueView:
        return _materialRoute(LeagueView());
      case kLeagueChampionView:
        if (arguments is Champion) {
          return _materialRoute(LeagueChampionView(arguments));
        }
        break;
      case kStoresMapView:
          return _materialRoute(StoresView());
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
