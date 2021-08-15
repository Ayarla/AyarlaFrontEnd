import 'package:ayarla/models/model_user.dart';
import 'package:flutter/cupertino.dart';

enum UserType {
  user,
  manager,
  employee,
}

class LoginService extends ChangeNotifier {
  bool isLoggedIn = false;
  bool isManager = false;

  UserModel userModel = UserModel();

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
