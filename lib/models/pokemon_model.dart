import 'dart:convert';

class PokemonModel {
  String name;
  String imageUrl;
  int id;
  List<Types> types;

  PokemonModel({
    required this.name,
    required this.imageUrl,
    required this.id,
    required this.types,
  });

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      name: map['name'],
      imageUrl: map['sprites']['other']['official-artwork']['front_default'],
      id: map['id'],
      types: List<Types>.from(map['types']?.map((x) => Types.fromMap(x))),
    );
  }

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));
}

class Types {
  late String name;
  late String url;

  Types({required this.name, required this.url});

  // Types.fromJson2(Map<String, dynamic> map) {
  //   name = map['name'];
  //   url = map[url];
  // }

  factory Types.fromMap(Map<String, dynamic> map) {
    return Types(
      name: map['name'],
      url: map['url'],
    );
  }

  factory Types.fromJson(String source) => Types.fromMap(json.decode(source));
}
