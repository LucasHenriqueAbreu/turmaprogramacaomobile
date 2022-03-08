import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> _tarefas = [];

  String? _descricaoTarefa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _constroiTextField(),
            _constroiListaDeTarefas(),
          ],
        ),
      ),
    );
  }

  Widget _constroiTextField() {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: 'Enter a search term',
        suffix: IconButton(
          icon: const Icon(Icons.save),
          onPressed: salvarTarefa,
        ),
      ),
      onChanged: (value) {
        _descricaoTarefa = value;
      },
    );
  }

  void salvarTarefa() {
    if (_descricaoTarefa != null) {
      setState(() {
        _tarefas.add(_descricaoTarefa!);
        _descricaoTarefa = null;
      });
    } else {
      print('Não pode ser vazio, apedeuta!');
    }
  }

  Widget _constroiListaDeTarefas() {
    return Expanded(
      child: ListView.builder(
        itemCount: _tarefas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_tarefas[index]),
          );
        },
      ),
    );
  }
}
