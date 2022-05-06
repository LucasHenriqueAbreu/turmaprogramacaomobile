import 'package:flutter/material.dart';
import 'package:marvelcatalogoads35/src/models/models.dart';
import 'package:marvelcatalogoads35/src/utils/http_provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _httpProvider = HttpProvider();
  List<Character> _herois = [];
  bool _carregando = false;

  @override
  void initState() {
    super.initState();
    _buscaHerois();
  }

  void _buscaHerois() async {
    _alteraCarregando(true);
    final result = await _httpProvider.get();
    setState(() {
      _herois = result.data!.results!;
    });
    _alteraCarregando(false);
  }

  void _alteraCarregando(bool carregando) {
    setState(() {
      _carregando = carregando;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogo de heróis'),
      ),
      body: _carregando
          ? const Center(child: CircularProgressIndicator())
          : _constroiListaHerois(),
    );
  }

  Widget _constroiListaHerois() {
    return ListView.builder(
      itemCount: _herois.length,
      itemBuilder: (context, index) => _criItemLista(index),
    );
  }

  Widget _criItemLista(int index) {
    final heroi = _herois[index];
    return ListTile(
      leading: _controiImageHeroi(heroi.thumbnail),
      title: Text(heroi.name!),
      subtitle: Text(heroi.description != null ? heroi.description! : ''),
    );
  }

  Widget _controiImageHeroi(Thumbnail? thumbnail) {
    if (thumbnail != null) {
      return Image.network(
        "${thumbnail.path}.${thumbnail.extension}",
      );
    }
    return const Icon(Icons.portable_wifi_off);
  }
}
