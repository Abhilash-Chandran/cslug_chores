import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/home.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(
            value: FirebaseAuth.instance.onAuthStateChanged)
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
