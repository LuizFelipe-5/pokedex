import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/pages/home_page/widgets/list_view_widget.dart';
import 'package:pokedex/shared/widgets/custom_app_bar_widget.dart';
import 'package:pokedex/utils/colors.dart';

class HomePage extends StatefulWidget {
  List<PokemonModel> pokemons;

  HomePage(this.pokemons);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get pokemons => widget.pokemons;

  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.pokemonStore.setListPokemon(widget.pokemons);
    controller.pokemonStore.setListPokemonFiltered(widget.pokemons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(controller: controller),
      body: ListViewWidget(
        controller: controller,
      ),
    );
  }
}
