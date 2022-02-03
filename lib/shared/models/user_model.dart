import 'dart:convert'; // Conversor JSON/UTF8

class UserModel {

  final String name;
  final String? photoURL;

  UserModel({ required this.name, required this.photoURL });


  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
      name: map['name'], photoURL: map['photoURL']
    );
  }

  factory UserModel.fromJson(String json) => UserModel.fromMap(jsonDecode(json));

  // Cria o MAP
  Map<String, dynamic> toMap() => {
    "name": name,
    "photoURL": photoURL
  };

  // Converte o Map para uma String JSON
  String toJson() => jsonEncode(toMap());
}