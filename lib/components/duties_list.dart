import 'package:flutter/material.dart';
import 'round_icon_button.dart';
import '../constants.dart';
import 'package:cslug_chores/Models/Duty.dart';
import 'package:provider/provider.dart';
import 'package:cslug_chores/Services/Firestore_service.dart';

FirestoreService db = FirestoreService();

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
    Duty duty = Provider.of<Duty>(context);
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
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          dutyItems.duties[indx],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          createNewRule
              ? Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: "Enter a new task.",
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(1.0),
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
                          db.createDutyItem(duty, newRuleText);
                          setState(() {
                            createNewRule = false;
                          });
                        },
                        buttonColor: kDutyCardColor,
                      )
                    ],
                  ))
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RoundIconButton(
                icon: Icons.add,
                onPressed: createNewRule
                    ? null // disables the add button.
                    : () {
                        setState(() {
                          createNewRule = true;
                        });
                      },
                buttonColor: createNewRule ? Colors.white10 : kDutyCardColor,
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
