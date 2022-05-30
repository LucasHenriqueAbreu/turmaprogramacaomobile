import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fofoqueiro/src/errors/auth_exception.dart';

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

  Future<void> createUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _setUser();
    } on FirebaseAuthException catch (error) {
      throw _getSignException(error);
    }
  }
  
  void _setUser() {
    _usuario = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  AuthException _getSignException(FirebaseAuthException error) {
    if (error.code == 'email-already-in-use') {
      return AuthException('Email já está em uso.');
    }
    if (error.code == 'invalid-email') {
      return AuthException('Email inválido.');
    }
    if (error.code == 'operation-not-allowed') {
      return AuthException('Você não tem permissão para isso.');
    }

    //'weak-password'
    return AuthException('Senha muito fraca.');
  }
}
