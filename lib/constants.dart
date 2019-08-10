import 'package:flutter/material.dart';
import 'screens/duties_screen.dart';
import 'screens/roster_screen.dart';
import 'screens/poll_screen.dart';

// Constants for Duty screen
const kDutyScaffoldColor = Color(0x46505A7D);
const kDutyCardColor = Color(0xFFC2C3CC);

// Constants for Roster screen
const kRosterScaffoldColor = Color(0xFF2849A4);
const Map<int, Color> kRosterCardColors = {
  0: Color(0xFFFEA403),
  1: Colors.black,
  2: Color(0xFF2681C8),
  3: Colors.grey
};

// Screen index map
Map<int, String> kScreenIndMap = {
  0: Duties.id,
  1: Roster.id,
  2: Poll.id,
};
