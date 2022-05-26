
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthService extends ChangeNotifier {

  User? _usuario;
  bool carregando = true;

  AuthService() {
    _init();
  }
  
  bool get usuarioLogado => _usuario != null;

  void _init() {
    FirebaseAuth.instance.userChanges().listen((usario) {
      _usuario = usario;
      carregando = false;
      notifyListeners();
    });
  }

}
