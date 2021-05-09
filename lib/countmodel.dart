import 'dart:core';

import 'package:flutter/material.dart';

class countmodel extends ChangeNotifier{
  int counter=1;
  int countervalvalue() {
    return counter;
  }
  void increament(){
    counter++;
    notifyListeners();
  }

  void reset(){
    counter=1;
    notifyListeners();
  }
}
