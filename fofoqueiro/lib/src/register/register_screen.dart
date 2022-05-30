import 'package:flutter/material.dart';
import 'package:fofoqueiro/src/errors/auth_exception.dart';
import 'package:fofoqueiro/src/services/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();
  final _confirmaSenha = TextEditingController();
  late AuthService _authService;

  @override
  void initState() {
    _authService = Provider.of<AuthService>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 75, left: 10, right: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Cadastro',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      label: Text('Email'),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateInputEmail,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _senha,
                    decoration: const InputDecoration(
                      label: Text('Senha'),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: _validateInputSenha,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _confirmaSenha,
                    decoration: const InputDecoration(
                      label: Text('Confirma senha'),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: _validateInputConfirmaSenha,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: _cadastrarUsuario,
                    child: const Text('Cadastrar'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      print('object');
                    },
                    child: const Text(
                      'Voltar para o login.',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _validateInputEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email é obrigatório';
    }

    if (!value.contains('@')) {
      return 'Email inválido';
    }

    return null;
  }

  String? _validateInputSenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória';
    }

    if (value.length < 6) {
      return 'Senha é tão fraca quanto quem criou, seu apedeuta!!!';
    }

    return null;
  }

  String? _validateInputConfirmaSenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirma senha é obrigatória';
    }

    if (value != _senha.text) {
      return 'A confirmação de senha está diferente da senha';
    }

    return null;
  }

  Future<void> _cadastrarUsuario() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _authService.createUser(_email.text, _senha.text);
        _showMessage('Usuário cadastrado com sucesso.');
      } on AuthException catch (e) {
        _showMessage(e.message);
      }
    }
  }

  void _showMessage(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }
}
