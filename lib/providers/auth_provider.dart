import 'package:flutter/widgets.dart';

class AuthProvider extends ChangeNotifier {
  final String userEmail = 'floraikanga112@gmail.com';
  final String userPassword = '12345678';
  bool isLoggedIn = false;

  bool login({required String? email, required String? password}) {
    if (email == userEmail && password == userPassword) {
      isLoggedIn = true;
    }

    return isLoggedIn;
  }
}
