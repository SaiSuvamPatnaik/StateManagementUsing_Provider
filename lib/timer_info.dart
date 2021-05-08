import 'package:flutter/material.dart';

class EligiblityScreenProvider extends ChangeNotifier{
  String _eligiblityMessage = "";
  bool _isEligible;

  //Getter for Eligiblity message
  String eligiblityMessage1() {
    return _eligiblityMessage;
  }
  //Getter for iseligible
  bool iseligible1(){
    return _isEligible;
  }

  void checkEligiblity(int age){
    if(age >= 18)
      eligibleForLicense();
    else
      notEligibleForLicense();
  }

  void eligibleForLicense(){
    _eligiblityMessage = "You are eligible to apply for Driving License";
    _isEligible = true;

    //Call this whenever there is some change in any field of change notifier.
    notifyListeners();
  }


  void notEligibleForLicense(){
    _eligiblityMessage = "You are not eligible to apply for Driving License";
    _isEligible = false;

    //Call this whenever there is some change in any field of change notifier.
    notifyListeners();
  }



}