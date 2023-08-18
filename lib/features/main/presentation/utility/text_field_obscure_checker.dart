import 'package:flutter/material.dart';

class TextFieldObscureChecker extends ChangeNotifier {
  bool _isObscured = true;
  bool get isObscured => _isObscured;
  set setObscure(bool isObscured) {
    _isObscured = isObscured;
    notifyListeners();
  }
}
