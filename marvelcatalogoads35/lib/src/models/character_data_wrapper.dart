import 'package:marvelcatalogoads35/src/models/character_data_container.dart';

class CharacterDataWrapperEx {
  int? code;
  CharacterDataContainerEx? data;

  static CharacterDataWrapperEx fromJson(Map<String, dynamic> json) {
    var result = CharacterDataWrapperEx();
    result.code = json['code'];
    result.data = CharacterDataContainerEx.fromJson(json['data']);
    return result;
  } 
}