import 'package:flutter/material.dart';

class Alarms {
  final String? id;
  TimeOfDay alarmTime;
  String alarmDays;
  String alarmTone;
  bool isEnable;
  double volume;
  bool isEditable;
  Alarms(this.id, this.alarmTime, this.alarmDays, this.alarmTone, this.isEnable,
      this.volume, this.isEditable);
}

List<Alarms> myAlarms = [
  Alarms("0", TimeOfDay.now(), "MTWTFSS", AvailableTones[0], true, 70, false),
  Alarms("1", TimeOfDay.now(), "-TW-F--", AvailableTones[1], true, 70, false),
  Alarms("2", TimeOfDay.now(), "-------", AvailableTones[2], false, 70, false),
  Alarms("3", TimeOfDay.now(), "MTWTF--", AvailableTones[3], false, 70, false),
  Alarms("4", TimeOfDay.now(), "---T---", AvailableTones[4], false, 70, false),
];
List<String> AvailableTones = [
  'Morning Routine',
  'One Step Forward',
  'Tone 3',
  'Tone 4',
  'Tone 5',
];
