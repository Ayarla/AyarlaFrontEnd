import 'package:flutter/cupertino.dart';

class LoginService extends ChangeNotifier {
  bool isLoggedIn = false;
  bool isManager = false;

  void loggedInUser() {
    isLoggedIn = !isLoggedIn;
    isManager = false;
    notifyListeners();
  }

  void loggedInManager() {
    isManager = !isManager;
    isLoggedIn = false;
    notifyListeners();
  }

  /// TODO - Password Mail
  sendPasswordMail() {}
}
