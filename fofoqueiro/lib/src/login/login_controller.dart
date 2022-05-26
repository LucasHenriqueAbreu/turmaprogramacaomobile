
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class LoginController extends ChangeNotifier {

  User? user;

  LoginController() {
    _init();
  }

  void _init() {
    var stream = FirebaseAuth.instance.userChanges();
    stream.listen((usario) {
      user = usario;
    });
  }

  bool get usuarioLogado => user != null;
}
