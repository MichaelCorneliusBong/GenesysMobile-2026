import 'package:flutter/foundation.dart';
import '../models/user_model.dart';

class AuthRepository extends ChangeNotifier {
  static final AuthRepository _instance = AuthRepository._internal();
  factory AuthRepository() => _instance;
  AuthRepository._internal();

  UserModel? _currentUser;
  bool _rememberMe = false;

  UserModel? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;
  bool get rememberMe => _rememberMe;

  void setRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  void loginDirect({String? email, String? name}) {
    final userEmail = (email != null && email.contains('@'))
        ? email
        : 'alexturner@gmail.com';
    final userName = (name != null && name.isNotEmpty)
        ? name
        : (userEmail == 'alexturner@gmail.com'
            ? 'Alex Turner'
            : userEmail.split('@')[0]);

    _currentUser = UserModel(
      name: userName,
      email: userEmail,
    );
    notifyListeners();
  }

  bool login(String email, String password) {
    loginDirect(email: email);
    return true;
  }

  bool register(String name, String email, String password) {
    loginDirect(email: email, name: name);
    return true;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
