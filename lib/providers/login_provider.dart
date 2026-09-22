import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  int loginnRegister = 0;
  void onLoginChanged(int index) {
    loginnRegister = index;
    notifyListeners();
  }
}
