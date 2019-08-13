import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'round_icon_button.dart';
import '../constants.dart';

class DutyList extends StatefulWidget {
  final String dutyName;

  DutyList({this.dutyName});

  @override
  _DutyListState createState() => _DutyListState();
}

class _DutyListState extends State<DutyList> {
  bool createNewRule = false;

  String newRuleText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('Duties').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: new Text('Loading...'));
                default:
                  return Expanded(
                    child: ListView(
                      children: snapshot.data.documents
                          .where((DocumentSnapshot document) =>
                              document['duty_name'] == this.widget.dutyName)
                          .map(
                        (DocumentSnapshot document) {
                          return new ListTile(
                            subtitle: new Text(document['display_text']),
                          );
                        },
                      ).toList(),
                    ),
                  );
              }
            },
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
                tag: "DutyNavigator1",
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
