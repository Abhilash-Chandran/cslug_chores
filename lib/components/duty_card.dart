import 'package:flutter/material.dart';
import 'round_icon_button.dart';
import 'package:cslug_chores/constants.dart';
import 'package:flare_flutter/flare_actor.dart';

class DutyCard extends StatelessWidget {
  final String assetName;
  final String animationName;

  DutyCard({this.assetName, this.animationName});

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints(minHeight: 150.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        //shape: BoxShape.circle,
        color: kDutyCardColor,
      ),
      height: 250.0,
      width: 100.0,
      //alignment: Alignment(0.95, 0.90),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Organize',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              height: 150.0,
              width: 200.0,
              child: FlareActor(
                assetName,
                animation: animationName,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
            RoundIconButton(
              icon: Icons.keyboard_arrow_right,
              onPressed: () {},
              buttonColor: kDutyCardColor,
            ),
          ],
        ),
      ),
    );
  }
}
