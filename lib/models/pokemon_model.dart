class PokemonModel {
  late String name;
  late String imageUrl;
  late int id;
  late List<Types> types;

  PokemonModel({
    required this.name,
    required this.imageUrl,
    required this.id,
    required this.types,
  });

  PokemonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['sprites']['other']['official-artwork']['front_default'];
    id = json['id'];
    types = [];

    json['types'].forEach((item) {
      types.add(Types.fromJson(item['type']));
    });
  }
}

class Types {
  late String name;
  late String url;

  Types({required this.name, required this.url});

  Types.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    url = map['url'];
  }
}
