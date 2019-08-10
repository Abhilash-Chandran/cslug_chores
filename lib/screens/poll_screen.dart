import 'package:flutter/material.dart';
import 'package:cslug_chores/components/bottom_navigation_bar.dart';
import 'package:flare_flutter/flare_actor.dart';

class Poll extends StatelessWidget {
  static const String id = 'Poll';

  @override
  Widget build(BuildContext context) {
    BottomNavigationWidget.selectedIndex = 2;
    return Scaffold(
      bottomNavigationBar: BottomNavigationWidget(),
      body: Center(
        child: FlareActor(
          'assets/Waste_Basket.flr',
          animation: 'Move_TrashCan',
        ),
      ),
    );
  }
}
