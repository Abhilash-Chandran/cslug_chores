import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cslug_chores/Models/Duty.dart';

class FirestoreService {
  final Firestore _db = Firestore.instance;

  Stream<List<Duty>> streamDuties() {
    return _db.collection("Duties").snapshots().map((QuerySnapshot snapshot) =>
        snapshot.documents
            .map((DocumentSnapshot doc) => Duty.fromSnapshot(doc))
            .toList());
  }

  Stream<DutyItems> streamDutyItems(String dutyId) {
    return _db
        .collection("Duties")
        .document(dutyId)
        .snapshots()
        .map((snapshot) => DutyItems.fromSnapshot(snapshot));
  }

  Future<void> createDutyItem(Duty dutyObj, String dutyItemText) {
    return _db.runTransaction((transaction) async {
      final freshSnap = await transaction.get(dutyObj.reference);

      await transaction.update(freshSnap.reference, {
        "display_text": FieldValue.arrayUnion([dutyItemText])
      });
    });
  }
}
