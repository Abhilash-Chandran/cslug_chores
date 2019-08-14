import 'package:flutter/material.dart';
import 'round_icon_button.dart';
import 'package:cslug_chores/constants.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'duties_list.dart';
import 'package:provider/provider.dart';
import 'package:cslug_chores/Models/Duty.dart';
import 'package:cslug_chores/Services/Firestore_service.dart';

class DutyCard extends StatelessWidget {
  final String dutyName;
  final String assetName;
  final String animationName;
  final int dutycardNumber;
  final Duty duty;
  final db = FirestoreService();

  DutyCard(
      {this.dutyName,
      this.assetName,
      this.animationName,
      this.dutycardNumber,
      this.duty});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        //shape: BoxShape.circle,
        color: kDutyCardColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              dutyName,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Container(
            height: 160.0,
            width: 200.0,
            child: FlareActor(
              assetName,
              animation: animationName,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
          Hero(
            tag: "DutyNavigator" + this.dutycardNumber.toString(),
            child: RoundIconButton(
              icon: Icons.keyboard_arrow_right,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return StreamProvider<DutyItems>.value(
                      value: db.streamDutyItems(dutyName),
                      initialData: DutyItems.fromMap({'display_text': []}),
                      child: Provider<Duty>.value(
                        value: duty,
                        child: DutyList(
                          cardNumber: dutycardNumber,
                        ),
                      ),
                    );
                  }),
                );
              },
              buttonColor: kDutyCardColor,
            ),
          ),
        ],
      ),
    );
  }
}
