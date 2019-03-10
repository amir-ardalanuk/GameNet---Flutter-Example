import 'package:flutter/material.dart';

enum SectionType { red, green, blue, yellow }

class Section {
  DateTime startedDate;
  int countDown = 0;
  SectionType type;
  bool isBusy = false;
  int additionPrice = 0;

  String title() {
    
    if (startedDate != null) {
      int minus = calculateBusyTime();
      return "minute : ${minus}";
    } else {
      switch (this.type) {
        case SectionType.blue:
          return "Blue Off";
          break;
        case SectionType.red:
          return "red Off";
          break;
        case SectionType.yellow:
          return "yellow Off";
          break;
        case SectionType.green:
          return "green Off";
          break;
      }
    }
  }

  int calculateBusyTime() {
    if(startedDate != null){
      var current = DateTime.now().millisecondsSinceEpoch;
      var started = startedDate.millisecondsSinceEpoch;
      var minus = ((current - started) / 1000 / 60 ).toInt();
      return minus;
    }
    return 0;
  }



  ColorSwatch backgroundColor(){
    switch (this.type) {
      case SectionType.blue:
        return Colors.blue;
        break;
      case SectionType.red:
        return Colors.red;
        break;
      case SectionType.yellow:
        return Colors.yellow;
        break;
      case SectionType.green:
        return Colors.green;
        break;
    }
  }

  Section(this.type);
}
