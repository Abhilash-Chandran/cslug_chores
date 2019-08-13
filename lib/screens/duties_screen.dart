import 'package:flutter/material.dart';
import 'package:cslug_chores/components/duty_card.dart';
import 'package:cslug_chores/Models/Duty.dart';
import 'package:provider/provider.dart';

class Duties extends StatelessWidget {
  static const String id = 'Duties';

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    List<Duty> duties = Provider.of<List<Duty>>(context);
    int index = 0;
    return Column(
      children: <Widget>[
        Expanded(
          child: SafeArea(
            top: false,
            bottom: false,
            child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio:
                    (orientation == Orientation.portrait) ? 7.0 / 9.0 : 1.3,
                padding: const EdgeInsets.only(top: 30.0),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                children: duties.map((Duty duty) {
                  index++;
                  return GridTile(
                    child: DutyCard(
                      dutyName: duty.dutyName,
                      assetName: 'assets/${duty.assetName}.flr',
                      animationName: duty.animationName,
                      dutycardNumber: index,
                    ),
                  );
                }).toList()),
          ),
        ),
      ],
    );
  }
}
