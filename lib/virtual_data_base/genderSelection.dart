import 'dart:collection';
import 'package:flutter/cupertino.dart';

enum Gender{
  female,
  male,
  unisex
}

class GenderSelection extends ChangeNotifier{
  Gender gender;
  selectGender(Gender selectedGender){
    gender=selectedGender;
  }

  UnmodifiableListView<Gender> get currentGender{
    return UnmodifiableListView([gender]);
  }
}