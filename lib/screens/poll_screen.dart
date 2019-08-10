import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class Poll extends StatelessWidget {
  static const String id = 'Poll';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlareActor(
        'assets/Waste_Basket.flr',
        animation: 'Move_TrashCan',
      ),
    );
  }
}
