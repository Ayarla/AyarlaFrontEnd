import 'package:flutter/cupertino.dart';

class Login extends ChangeNotifier{

  bool holder = false;
  bool isManager=false;
  void loggedInUser() {
    holder=!holder;
    isManager=false;
    notifyListeners();
  }



  void loggedInManager(){
    isManager=!isManager;
    holder=false;
    notifyListeners();
  }

}