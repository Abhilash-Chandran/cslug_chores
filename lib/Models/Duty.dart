import 'package:cloud_firestore/cloud_firestore.dart';

class Duty {
  final String dutyName;
  final String animationName;
  final String assetName;
  final DocumentReference reference;

  Duty.fromMap(Map<String, dynamic> map, {this.reference})
      : dutyName = reference.documentID,
        animationName = map['animationName'],
        assetName = map['assetName'];

  Duty.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Duty<$dutyName:$animationName>";
}

class DutyItems {
  final List<String> duties;
  final DocumentReference reference;

  DutyItems.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['display_text'] != null),
        duties = List<String>.from(map['display_text']);

  DutyItems.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
