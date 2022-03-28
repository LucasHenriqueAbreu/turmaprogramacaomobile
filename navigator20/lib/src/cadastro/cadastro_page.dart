import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Navigator(
        initialRoute: '/one',
        onGenerateRoute: (settings) {
          var route = settings.name;
          Widget page;
          switch (route) {
            case '/one':
              page = Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('one'),
                    TextButton(onPressed: () {
                      Navigator.pushNamed(context, '/two');
                    }, child: const Text('Próximo'))
                  ],
                ),
              );
              break;
            case '/two':
              page = Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('one'),
                    TextButton(onPressed: () {
                      Navigator.pushNamed(context, '/one');
                    }, child: const Text('Voltar'))
                  ],
                ),
              );
              break;
            default:
              return null;
          }
          return MaterialPageRoute(
            builder: (context) => page,
            settings: settings,
          );
        },
      ),
    );
  }
}
