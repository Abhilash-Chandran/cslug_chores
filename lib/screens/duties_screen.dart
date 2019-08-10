import 'package:flutter/material.dart';
import 'package:cslug_chores/components/bottom_navigation_bar.dart';
import 'package:cslug_chores/components/duty_card.dart';
import 'package:cslug_chores/constants.dart';

class Duties extends StatelessWidget {
  static const String id = 'Duties';

  @override
  Widget build(BuildContext context) {
    BottomNavigationWidget.selectedIndex = 0;
    return Scaffold(
      backgroundColor: kDutyScaffoldColor,
      //appBar: AppBar(title: const Text(_title)),
      bottomNavigationBar: new BottomNavigationWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 40.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: DutyCard(
                      assetName: 'assets/Vessels.flr',
                      animationName: 'organize',
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: DutyCard(
                      assetName: 'assets/Washing_Machine.flr',
                      animationName: 'wash',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0).copyWith(bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: DutyCard(
                      assetName: 'assets/Vessels.flr',
                      animationName: 'organize',
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: DutyCard(
                      assetName: 'assets/Waste_Basket.flr',
                      animationName: 'Move_TrashCan',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
