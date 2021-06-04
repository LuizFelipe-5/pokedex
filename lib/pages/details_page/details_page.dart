import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/shared/stores/pokemon_store.dart';

class DetailsPage extends StatefulWidget {
  final List<PokemonModel> pokemons;
  final int indexCurrentPokemon;
  final PokemonStore store;

  const DetailsPage(
      {Key? key,
      required this.pokemons,
      required this.indexCurrentPokemon,
      required this.store})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<PokemonModel> get pokemons => widget.pokemons;
  int get indexCurrentPokemon => widget.indexCurrentPokemon;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          widget.store.pokemonSelected.types.first.imageColorAvatar,
    );
  }
}
