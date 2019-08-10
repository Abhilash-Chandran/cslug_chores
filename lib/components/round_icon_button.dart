import 'package:flutter/material.dart';
// import 'package:cslug_chores/constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {@required this.icon, @required this.onPressed, this.buttonColor});

  final Function onPressed;
  final IconData icon;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.black54,
      ),
      onPressed: onPressed,
      elevation: 5.0,
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: CircleBorder(),
      fillColor: buttonColor,
      splashColor: Colors.black,
    );
  }
}
