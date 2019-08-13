import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cslug_chores/Models/Duty.dart';

class FirestoreService {
  final Firestore _db = Firestore.instance;

  Stream<List<Duty>> streamDuties() {
    return _db
        .collection("Duties")
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.documents)
        .map((List<DocumentSnapshot> docsnapshots) {
      List<Duty> duties = [];
      docsnapshots.forEach(
        (docsnapshot) => duties.add(Duty.fromSnapshot(docsnapshot)),
      );
      return duties;
    });
  }

  Stream<DutyItems> streamDutyItems(String dutyId) {
    return _db
        .collection("Duties")
        .document(dutyId)
        .snapshots()
        .map((snapshot) => DutyItems.fromSnapshot(snapshot));
  }
}
