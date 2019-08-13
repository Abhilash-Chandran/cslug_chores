import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:cslug_chores/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:cslug_chores/Models/Duty.dart';
import 'package:cslug_chores/Services/Firestore_service.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  final db = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<Duty>>.value(
          value: db.streamDuties(),
          initialData: [],
        ),
      ],
      child: MaterialApp(
        title: _title,
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueGrey,
          accentColor: Colors.deepOrange,
          scaffoldBackgroundColor: kDutyScaffoldColor,
        ),
        home: HomeWidget(),
      ),
    );
  }
}
