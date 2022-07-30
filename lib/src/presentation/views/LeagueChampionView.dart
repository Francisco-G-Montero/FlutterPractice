import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/league/LeagueBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/league/LeagueState.dart';
import 'package:whatibeendoing/src/presentation/blocs/leaguechampion/LeagueChampionBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/leaguechampion/LeagueChampionEvent.dart';
import 'package:whatibeendoing/src/presentation/blocs/leaguechampion/LeagueChampionState.dart';

import '../../data/model/league/Champion.dart';
import '../blocs/league/LeagueEvent.dart';
import '../widgets/TextInputWidget.dart';

class LeagueChampionView extends StatelessWidget {
  final Champion _champion;
  final tiwName = TextInputWidget(labelText: "Nombre del campeon",);
  final tiwDescription = TextInputWidget(labelText: "Descripción del campeon", maxLines: 7,);
  final tiwImageUrl = TextInputWidget(labelText: "Url de la imagen",);

  LeagueChampionView(this._champion);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Champion editor"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    tiwName.controller.text = _champion.name;
    tiwDescription.controller.text = _champion.description;
    tiwImageUrl.controller.text = _champion.imageUrl;
    return BlocListener<LeagueChampionBloc, LeagueChampionState>(
      listener: (_, state) {
        if (state is LeagueChampionDone) {
          context.read<LeagueChampionBloc>().add(EditMode());
          context.read<LeagueBloc>().add(LeagueResetState());
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<LeagueChampionBloc, LeagueChampionState>(builder: (_, state) {
        print("BlocBuilder ${state}");
        if (state is LeagueChampionLoading) {
          context.read<LeagueChampionBloc>().add(EditMode());
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LeagueChampionEditing) {
          print("BlocListener LeagueChampionEditing");
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  tiwName,
                  SizedBox(
                    height: 20,
                  ),
                  tiwDescription,
                  SizedBox(
                    height: 20,
                  ),
                  tiwImageUrl,
                  SizedBox(
                    height: 20,
                  ),
                  LoadingButton(state.leagueChampionStateModel.isLoading, context),
                ],
              ),
            ),
          );
        }
        return SizedBox();
      }),
    );
  }

  Widget LoadingButton(bool showLoading, BuildContext context) {
    print("LoadingButton showLoading $showLoading");
    if (showLoading) {
      return CircularProgressIndicator();
    } else {
      return ElevatedButton(
          onPressed: () {
            final champion = _champion.copyWith(
                name: tiwName.controller.text,
                description: tiwDescription.controller.text,
                imageUrl: tiwImageUrl.controller.text);
            context.read<LeagueChampionBloc>().add(UpdateChampion(champion));
          },
          child: Text("Finalizar"));
    }
  }
}
