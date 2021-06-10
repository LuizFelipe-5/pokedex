import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonRepository {
  Dio _dio = Dio();

  PokemonRepository() {
    _dio.options.baseUrl = 'https://pokeapi.co/api/v2/';
  }

  Future<List<PokemonModel>> getPokemons() async {
    var pokemons = <PokemonModel>[];
    try {
      final response = await _dio.get('pokemon?limit=10');

      if (response.statusCode == 200) {
        final listResult = response.data['results'];

        for (var item in listResult) {
          String url = item['url'];

          var pokemon = await _getPokemonByUrl(url);

          pokemons.add(pokemon);
        }

        return pokemons;
      } else {
        throw Exception('Erro ao buscar pokemons');
      }
    } catch (e) {
      return [];
    }
  }

  Future<PokemonModel> _getPokemonByUrl(String url) async {
    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final pokemon = PokemonModel.fromJson(response.data);
        return pokemon;
      } else {
        throw Exception('Erro ao buscar o pokemon');
      }
    } catch (e) {
      throw Exception('Erro ao buscar o pokemon');
    }
  }
}
