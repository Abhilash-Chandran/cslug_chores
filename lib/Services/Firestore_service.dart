import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cslug_chores/Models/Duty.dart';

final Firestore _db = Firestore.instance;
String rootCollection = "cslug_chores";

Stream<Duty> streamDuties() {
  return _db
      .collection(rootCollection)
      .document("Duties")
      .snapshots()
      .map((snapshot) => Duty.fromSnapshot(snapshot));
}

Stream<Duty> streamDutyItems(CollectionReference reference, String dutyId) {
  return reference
      .document(dutyId)
      .snapshots()
      .map((snapshot) => Duty.fromSnapshot(snapshot));
}
