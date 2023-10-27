import 'package:flutter/foundation.dart';
import 'package:instagram/models/user_models.dart';

class LoginLogic extends ChangeNotifier {
  late UserModel _LogginUser;
  UserModel get LogginUser => _LogginUser;

  void setLogginUser(UserModel userModel) {
    _LogginUser = userModel;
    notifyListeners();
  }

  String get FullName {
    return _LogginUser.name;
  }
}
