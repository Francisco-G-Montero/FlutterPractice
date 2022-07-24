import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatibeendoing/src/config/utils/constants.dart';
import 'package:whatibeendoing/src/presentation/blocs/league/LeagueEvent.dart';
import '../../data/model/league/Champion.dart';
import '../blocs/league/LeagueBloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChampionWidget extends StatelessWidget {
  final Champion _champion;

  const ChampionWidget(this._champion);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FadeInImage.assetNetwork(
                    image: _champion.imageUrl,
                    placeholder: locale.asset_loading,
                    fit: BoxFit.fitWidth,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              "${_champion.name}",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
            SizedBox(
              height: 20,
            ),
            Text(
              "Descripción",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${_champion.description}",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildElevatedButton(
                    context,
                    () => Navigator.of(context)
                        .pushNamed(kLeagueChampionView, arguments: _champion),
                    "Editar",
                    Icons.edit),
                SizedBox(
                  width: 20,
                ),
                buildElevatedButton(context, () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text("Atención"),
                          content: Text("¿Está seguro que desea eliminar éste campeón?"),
                          actions: [
                            CupertinoDialogAction(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }, child: Text("Cancelar")),
                            CupertinoDialogAction(
                                onPressed: () {
                                  context.read<LeagueBloc>().add(DeleteChampion(_champion));
                                  Navigator.of(context).pop();
                                }, child: Text("Aceptar")),
                          ],
                        );
                      },
                      barrierDismissible: false);
                }, "Eliminar", Icons.delete_forever),
              ],
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(
      BuildContext context, VoidCallback onPressed, String text, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [Text(text), Icon(icon)],
      ),
    );
  }
}
