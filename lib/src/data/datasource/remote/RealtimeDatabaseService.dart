import 'package:firebase_database/firebase_database.dart';
import '../../model/league/Champion.dart';
import '../../model/places/Place.dart';

class RealtimeDatabaseService {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  DatabaseReference _getChampionsReference() {
    return FirebaseDatabase.instance.ref('champions');
  }

  DatabaseReference _getMarksReference() {
    return FirebaseDatabase.instance.ref('marks');
  }

  Future<List<Champion>> getChampions() async {
    var champions = <Champion>[];
    await _getChampionsReference()
        .get()
        .then((snapshot) {
          if(snapshot.exists){
            snapshot.children.forEach((element) {
              if(element != null){
                final dataValue = new Map<String, dynamic>.from(element.value as Map);
                final champion = Champion.fromJson(dataValue);
                champion.id = element.key!;
                champions.add(champion);
              }
            });
          }
    });
    return champions;
  }

  Future<void> updateChampion(Champion champion) async {
    await Future.delayed(const Duration(milliseconds: 4000));
    return _getChampionsReference().child(champion.id).set(champion.toJson());
  }

  Future<void> deleteChampion(Champion champion) async {
    return _getChampionsReference().child(champion.id).remove();
  }

  Future<List<Place>> getMakrs() async {
    var marks = <Place>[];
    /*await _getChampionsReference()
        .get()
        .then((snapshot) {
      if(snapshot.exists){
        snapshot.children.forEach((element) {
          if(element != null){
            final dataValue = new Map<String, dynamic>.from(element.value as Map);
            final champion = Champion.fromJson(dataValue);
            champion.id = element.key!;
            champions.add(champion);
          }
        });
      }
    });*/
    return marks;
  }
}