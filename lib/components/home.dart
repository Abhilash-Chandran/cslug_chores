import 'package:flutter/material.dart';
import 'package:cslug_chores/constants.dart';
import 'package:cslug_chores/screens/duties_screen.dart';
import 'package:cslug_chores/screens/roster_screen.dart';
import 'package:cslug_chores/screens/poll_screen.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;

  static List<Widget> _screenWidgets = <Widget>[
    Duties(),
    Roster(),
    Poll(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenWidgets.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            title: Text('Chores'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Roster'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll),
            title: Text('Poll'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kDutyScaffoldColor.withOpacity(1.0),
        onTap: (int value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
