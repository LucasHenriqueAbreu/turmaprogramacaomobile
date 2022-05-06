class CharacterEx {
  int? id;
  String? name;
  String? description;

  static CharacterEx fromJson(Map<String, dynamic> json) {
    final result = CharacterEx();
    result.id = json['id'];
    result.name = json['name'];
    result.description = json['description'];
    return result;
  }
}