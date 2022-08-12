import 'package:flutter/widgets.dart';
import 'package:insta/model/user.dart';
import 'package:insta/resource/auth_method.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User? get getUser {
    var u = _user;
    if (_user != null) {
      return u;
    }
    return u;
  }

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
