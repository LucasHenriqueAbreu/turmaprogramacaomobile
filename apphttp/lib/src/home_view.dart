import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _carregando = false;
  List _usuarios = [];


  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    setState(() {
      _carregando = true;
    });
    final result = await _buscaUsuarios();
    setState(() {
      _usuarios = result;
      _carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
      ),
      body: _constroiBody(),
    );
  }

  Future<List> _buscaUsuarios() async {
    final uri =
        Uri.parse('https://62673d0701dab900f1bc8f00.mockapi.io/api/users');
    final result = await http.get(uri);
    final usuarios = jsonDecode(result.body) as List;
    return usuarios;
  }

  Widget _constroiBody() {
    if (_carregando) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemCount: _usuarios.length,
      itemBuilder: (context, index) => Text(_usuarios[index]['name']),
    );
  }
}
