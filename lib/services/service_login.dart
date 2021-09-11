import 'package:ayarla/api_services/user_api_services.dart';
import 'package:ayarla/models/model_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/services/service_user.dart';

enum UserType {
  user,
  manager,
  employee,
}

class LoginService extends ChangeNotifier {
  UserApiServices _userApiServices = UserApiServices();
  UserModel currentUser = UserModel();
  bool isLoggedIn = false;
  bool isManager = false;

  /// Seems fine rn.
  ///
  /// I removed some properties of UserModel for security.
  ///
  /// Also i added a button on user page in order to switch to the manager view.
  ///
  /// We need a if statement there.
  login({int userID, BuildContext context}) async {
    var data = await _userApiServices.getUser(id: userID);
    currentUser = UserModel.fromJson(data);
    Provider.of<UserService>(context, listen: false).currentUser = currentUser;
    print(currentUser.isActive);
    print(Provider.of<UserService>(context, listen: false).currentUser.isActive);
    notifyListeners();
  }

  /// TODO - Password Mail
  sendPasswordMail() {}
}
