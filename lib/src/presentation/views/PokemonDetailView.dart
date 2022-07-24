import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whatibeendoing/src/presentation/blocs/remote_pokemon_details/PokemonBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/remote_pokemon_details/PokemonEvent.dart';
import 'package:whatibeendoing/src/presentation/blocs/remote_pokemon_details/PokemonState.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/model/pokemon_detail/PokemonDetail.dart';

class PokemonDetailView extends HookWidget {
  final String pokemonName;

  PokemonDetailView(this.pokemonName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text("Pokemon Detail: $pokemonName"),
      centerTitle: true,
      backgroundColor: Colors.redAccent,
    );
  }

  Widget _buildBody(BuildContext context) {
    context.read<PokemonBloc>().add(CleanPokemon());
    context.read<PokemonBloc>().add(GetPokemon(pokemonName));
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (_, state) {
        if (state is PokemonLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is PokemonError) {
          return const Center(
            child: Icon(Ionicons.refresh),
          );
        }
        if (state is PokemonDone) {
          return _buildPokemon(state.pokemonDetail!, context);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildPokemon(PokemonDetail pokemonDetail, BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Ionicons.card),
              title: Text(pokemonDetail.name ?? 'No Name'),
              subtitle: Text("Exp. base: ${pokemonDetail.baseExperience}"),
            ),
            SizedBox(
              width: 145,
              height: 145,
              child: FadeInImage.assetNetwork(image: pokemonDetail
                  .sprites!.other!.officialartwork!.frontDefault!, placeholder: locale.asset_loading,)
            ),
            Text(
              "Habilidades",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                ...List<Widget>.from(
                    pokemonDetail.abilities!.map((ability) => Column(
                          children: [Text(ability.ability?.name ?? 'no name')],
                        )))
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Movimientos",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  ...List<Widget>.from(
                      pokemonDetail.moves!.map((ability) => Column(
                            children: [Text(ability.move!.name ?? 'no name')],
                          )))
                ],
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
