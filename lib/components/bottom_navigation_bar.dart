import 'package:flutter/material.dart';
import 'package:cslug_chores/constants.dart';

class BottomNavigationWidget extends StatefulWidget {
  static int selectedIndex;

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      currentIndex: BottomNavigationWidget.selectedIndex,
      selectedItemColor: kDutyScaffoldColor.withOpacity(1.0),
      onTap: (int value) {
        setState(() {
          BottomNavigationWidget.selectedIndex = value;
          Navigator.pop(context);
          Navigator.pushNamed(context, kScreenIndMap[value]);
        });
      },
    );
  }
}
