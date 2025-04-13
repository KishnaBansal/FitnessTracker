import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _gender = "";
  int _age = 0;

  String get gender => _gender;
  int get age => _age;

  void setGender(String _gender) {
    _gender = gender;
  }
  void setAge(int _age) {
    _age = age;
  }
}
