import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/shared/stores/pokemon_store.dart';

class HomeController {
  PokemonStore pokemonStore = PokemonStore();

  void getPokemonFiltered(String _text) {
    if (_text.length > 0) {
      final pokemonsFiltered = <PokemonModel>[];
      for (final pokemon in pokemonStore.pokemons) {
        final pokemonName = pokemon.name.toLowerCase();
        if (pokemonName.contains(_text.toLowerCase())) {
          pokemonsFiltered.add(pokemon);
        }
      }
      pokemonStore.setListPokemonFiltered(pokemonsFiltered);
    } else {
      pokemonStore.setListPokemonFiltered(pokemonStore.pokemons);
    }
  }
}
