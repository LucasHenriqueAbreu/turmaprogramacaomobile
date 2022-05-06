import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:marvelcatalogoads35/src/models/models.dart';


class HttpProvider {

  final String dominio = 'https://gateway.marvel.com/v1/public';
  final String chavePublica = '358c9f95d29e9c875f63729ba98d7789';
  final String chavePrivada = '192b106a915d8691c5324c13492dd5162969c3d1';


  Future<CharacterDataWrapper> get() async {
    final ts = DateTime.now().microsecondsSinceEpoch;
    final hash = md5.convert(
      utf8.encode('$ts$chavePrivada$chavePublica')
    ).toString();
    final uri = Uri.parse(
      '$dominio/characters?ts=$ts&apikey=$chavePublica&hash=$hash'
    );
    final response = await http.get(uri);
    final dados = jsonDecode(response.body);
    return CharacterDataWrapper.fromJson(dados);
  }

}