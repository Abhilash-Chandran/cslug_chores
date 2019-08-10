import 'package:flutter/material.dart';
import 'screens/duties_screen.dart';
import 'screens/roster_screen.dart';
import 'screens/poll_screen.dart';
import 'constants.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey,
        accentColor: Colors.deepOrange,
        scaffoldBackgroundColor: kDutyScaffoldColor,
      ),
      routes: {
        Duties.id: (context) => Duties(),
        Roster.id: (context) => Roster(),
        Poll.id: (context) => Poll(),
      },
      initialRoute: Duties.id,
    );
  }
}
