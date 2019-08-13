import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'round_icon_button.dart';
import '../constants.dart';
import 'package:cslug_chores/Models/Duty.dart';
import 'package:provider/provider.dart';

class DutyList extends StatefulWidget {
  final int cardNumber;
  DutyList({this.cardNumber});
  @override
  _DutyListState createState() => _DutyListState();
}

class _DutyListState extends State<DutyList> {
  bool createNewRule = false;

  String newRuleText;

  @override
  Widget build(BuildContext context) {
    DutyItems dutyItems = Provider.of<DutyItems>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: dutyItems.duties.length,
                itemBuilder: (BuildContext context, int indx) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dutyItems.duties[indx]),
                      ),
                    ),
                  );
                }),
          ),
          createNewRule
              ? Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onChanged: (value) {
                          newRuleText = value;
                        },
                      ),
                    ),
                    RoundIconButton(
                      icon: Icons.send,
                      onPressed: () {
                        Firestore.instance.collection("Duties").add({
                          "duty_name": "Organize",
                          "display_text": newRuleText
                        });
                      },
                      buttonColor: kDutyCardColor,
                    )
                  ],
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RoundIconButton(
                icon: Icons.add,
                onPressed: createNewRule
                    ? () {} // disables the add button.
                    : () {
                        setState(() {
                          createNewRule = true;
                        });
                      },
                buttonColor: kDutyCardColor,
              ),
              Hero(
                tag: "DutyNavigator" + widget.cardNumber.toString(),
                child: RoundIconButton(
                  icon: Icons.keyboard_arrow_left,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  buttonColor: kDutyCardColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
