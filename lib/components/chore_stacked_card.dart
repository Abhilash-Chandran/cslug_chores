import 'package:flutter/material.dart';

class ChoreStackedCard extends StatelessWidget {
  final String month;
  final String dates;
  final String person1;
  final String person2;
  final Color cardColor;
  ChoreStackedCard(
      {this.month, this.dates, this.person1, this.person2, this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 200.0,
      width: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.elliptical(10.0, 10.0)),
        color: cardColor,
        border: Border.all(width: 1.0, color: Colors.white24),
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Chip(
              padding: EdgeInsets.only(
                left: 44.0,
              ),
              label: Text(
                dates,
                style: TextStyle(
                  color: Colors.yellowAccent,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              //backgroundColor: Colors.white,
              //backgroundColor: Colors.cyanAccent,
              radius: 25.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    month,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Chip(
                  label: Text(
                    person1,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Chip(
                  label: Text(
                    person2,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
