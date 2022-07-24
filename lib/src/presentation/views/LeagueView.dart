import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatibeendoing/src/data/model/league/Champion.dart';
import 'package:whatibeendoing/src/presentation/blocs/league/LeagueBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/league/LeagueEvent.dart';
import 'package:whatibeendoing/src/presentation/blocs/league/LeagueState.dart';

import '../widgets/ChampionWidget.dart';

class LeagueView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("League Of Legends"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(onPressed: (){
            context.read<LeagueBloc>().add(LeagueResetState());
          }, icon: Icon(Icons.refresh)),
        ],
      ),
      body: _buildBody(context),
      backgroundColor: Colors.white70,
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocListener<LeagueBloc, LeagueState>(
        listener: (_, state){
          if(state is LeagueLoading){
            context.read<LeagueBloc>().add(GetChampions());
          }
        },
      child: BlocBuilder<LeagueBloc, LeagueState>(
        builder: (_, state){
          if(state is LeagueLoading){
            context.read<LeagueBloc>().add(GetChampions());
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is LeagueDone){
            if(!state.leagueStateModel.loadingChampions){
              if(state.leagueStateModel.championList.isNotEmpty){
                return _buildChampionList(state.leagueStateModel.championList);
              } return Center(child: Text("No hay campeones en la base de datos remota"),);
            } return Center(child: Text("Cargando la lista..."),);
          }
          if(state is LeagueError){
            return Center(child: Text("Firebase DATABASE ERROR"),);
          }
          return SizedBox();
        },
      ),
    );
  }

  Widget _buildChampionList(List<Champion> championList) {
    return ListView.builder(
        itemCount: championList.length,
        itemBuilder: (BuildContext context, int index){
          return ChampionWidget(championList[index]);
        },
    );
  }
}