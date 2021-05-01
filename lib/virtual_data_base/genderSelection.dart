import 'dart:collection';
import 'package:ayarla/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class GenderSelection extends ChangeNotifier{
  Gender gender;
  selectGender(Gender selectedGender){
    gender=selectedGender;
  }

  UnmodifiableListView<Gender> get currentGender{
    return UnmodifiableListView([gender]);
  }
}