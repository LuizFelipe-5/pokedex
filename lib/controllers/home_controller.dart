import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/pages/details_page/details_page.dart';
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

  void selectPokemon(
      {required PokemonModel pokemon,
      required BuildContext context,
      required int index}) {
    pokemonStore.setPokemonSelected(pokemon);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          pokemons: pokemonStore.pokemonsFiltered,
          indexCurrentPokemon: index,
          store: pokemonStore,
        ),
      ),
    );
  }
}
