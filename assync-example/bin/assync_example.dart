import 'dart:convert';

import 'package:http/http.dart' as http;


const apiUrl = 'https://62673d0701dab900f1bc8f00.mockapi.io/api';
Future<void> main() async {

  var uri = Uri.parse('$apiUrl/users');
  // Utilizando o método then que vai executar sua função de callback quando o processamento asíncrono for completo.
  // http.get(uri).then((result) {
  //   print(result.body);
  // });

  // Utilizando o await (aguarda o resultado antes de continuar para a próxima instrução)
  var result = await http.get(uri);
  var users = jsonDecode(result.body) as List;
  for(var i = 0; i < users.length; i ++) {
    var user = users[i];
    print(user['name']);
  }
}


