import 'package:flutter/material.dart';

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

  String get imagePath {
    return 'assets/types/$name.svg';
  }

  Color get avatarColor {
    Color color;
    switch (name) {
      case 'bug':
        color = Color(0xFFAAB734);
        break;
      case 'dark':
        color = Color(0xFF695748);
        break;
      case 'dragon':
        color = Color(0xFF6238F7);
        break;
      case 'electric':
        color = Color(0xFFEDCF41);
        break;
      case 'fairy':
        color = Color(0xFFC284AA);
        break;
      case 'fighting':
        color = Color(0xFFA7312C);
        break;
      case 'fire':
        color = Color(0xFFD57F3A);
        break;
      case 'flying':
        color = Color(0xFFA18EF0);
        break;
      case 'grass':
        color = Color(0xFF94C557);
        break;
      case 'ghost':
        color = Color(0xFF6C5894);
        break;
      case 'ground':
        color = Color(0xFFD8BD6B);
        break;
      case 'ice':
        color = Color(0xFFABD8D5);
        break;
      case 'normal':
        color = Color(0xFFA7A67B);
        break;
      case 'poison':
        color = Color(0xFF8E419D);
        break;
      case 'psychic':
        color = Color(0xFFD95584);
        break;
      case 'rock':
        color = Color(0xFFAFA041);
        break;
      case 'water':
        color = Color(0xFF728EED);
        break;
      case 'steel':
        color = Color(0xFFB5B5CC);
        break;
      default:
        color = Color(0xFFB5B5CC);
    }
    return color;
  }
}
