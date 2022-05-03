import 'package:dhanush/appconstants.dart';
import 'package:flutter/cupertino.dart';

class AuthNotifier extends ChangeNotifier {
  bool loggedin = false;
  void setLoggedinToTrue() {
    loggedin = true;
    notifyListeners();
  }
}
