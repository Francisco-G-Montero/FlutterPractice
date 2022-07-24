import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatibeendoing/src/data/model/league/Champion.dart';
import 'package:whatibeendoing/src/data/util/Wrapper.dart';

class FirestoreService {
  FirebaseFirestore database = FirebaseFirestore.instance;

  Future<List<Champion>> getChampions() async {
    var champions = <Champion>[];
    await database
        .collection(championsRef.path)
        .get()
        .then((querySnapshot) =>
        querySnapshot.docs.forEach((element) {
          final champion = Champion.fromJson(element.data());
          champion.id = element.id;
          champions.add(champion);
        }));
    //ESTUVE VIENDO COMO MANEJAR EL ID JUNTO CON LOS CODIGOS AUTOGENERADOS DE LOS MODELOS
    return champions;
  }

  Future<void> updateChampion(Champion champion) async {
    await Future.delayed(const Duration(milliseconds: 4000));
      return database
          .collection(championsRef.path)
          .doc(champion.id)
          .update(champion.toJson());
  }

  Future<void> deleteChampion(Champion champion) async {
      return database
          .collection(championsRef.path)
          .doc(champion.id)
          .delete();
  }
}
