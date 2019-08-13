import 'package:cloud_firestore/cloud_firestore.dart';

class Duty {
  final String dutyName;
  final CollectionReference dutyItems;
  final DocumentReference reference;

  Duty.fromMap(Map<String, dynamic> map, {this.reference})
      : dutyName = "",
        dutyItems = reference.collection(map['duty_name']);

  Duty.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Duty<$dutyName:$dutyItems>";
}

class DutyItems {
  final List<String> duties = [];
  final DocumentReference reference;

  DutyItems.fromMap(Map<String, dynamic> map, {this.reference}) {
    assert(map['duties'] != null);
    print(map);
  }
}
