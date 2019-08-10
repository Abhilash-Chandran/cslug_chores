import 'package:flutter/material.dart';
import 'package:cslug_chores/components/chore_stacked_card.dart';
import 'package:cslug_chores/components/bottom_navigation_bar.dart';
import 'package:cslug_chores/constants.dart';

class Roster extends StatelessWidget {
  static const String id = 'Roster';

  @override
  Widget build(BuildContext context) {
    BottomNavigationWidget.selectedIndex = 1;
    return Scaffold(
      backgroundColor: kDutyScaffoldColor,
      bottomNavigationBar: new BottomNavigationWidget(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Container(
            height: 250.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                ChoreStackedCard(
                  cardColor: kDutyCardColor.withOpacity(0.7),
                  month: 'June',
                  dates: '16-22',
                  person1: 'Sven',
                  person2: 'Abhilash',
                ),
                SizedBox(width: 10.0),
                ChoreStackedCard(
                  cardColor: Colors.red.withOpacity(0.7),
                  month: 'June',
                  dates: '16-22',
                  person1: 'Sven',
                  person2: 'Abhilash',
                ),
                SizedBox(width: 10.0),
                ChoreStackedCard(
                  cardColor: Colors.cyanAccent.withOpacity(0.7),
                  month: 'June',
                  dates: '16-22',
                  person1: 'Sven',
                  person2: 'Abhilash',
                ),
                SizedBox(width: 10.0),
                ChoreStackedCard(
                  cardColor: Colors.greenAccent.withOpacity(0.7),
                  month: 'June',
                  dates: '16-22',
                  person1: 'Sven',
                  person2: 'Abhilash',
                ),
                SizedBox(width: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
