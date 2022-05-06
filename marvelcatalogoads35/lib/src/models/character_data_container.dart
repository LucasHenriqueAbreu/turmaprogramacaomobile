import 'package:marvelcatalogoads35/src/models/character.dart';

class CharacterDataContainerEx {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<CharacterEx>? results;

  static CharacterDataContainerEx fromJson(Map<String, dynamic> json) {
    final result = CharacterDataContainerEx();
    result.offset = json['offset'];
    result.limit = json['limit'];
    result.total = json['total'];
    result.count = json['count'];
    // Método `map` sempre retorna uma "lista" do tipo Iterable, que é
    // uma classe "pai/mãe" de List e como o atributo `results` é um List, é necessário a convesão.
    result.results = json['results']
        .map<CharacterEx>(
          (character) => CharacterEx.fromJson(character),
        )
        .toList();
    return result;
  }
}
