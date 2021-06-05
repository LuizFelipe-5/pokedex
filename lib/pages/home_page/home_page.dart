import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/models/pokemon_model.dart';
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
      backgroundColor: primaryColor0,
      appBar: AppBar(
        backgroundColor: appBarColor,
        centerTitle: true,
        toolbarHeight: 125,
        title: Column(
          children: [
            Text(
              'Pokedex',
              style: TextStyle(
                color: black,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: controller.getPokemonFiltered,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: gray,
                ),
                hintText: 'Encontre um pokémon',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: gray,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(0),
              ),
            ),
          ],
        ),
      ),
      body: _body(controller),
    );
  }
}

_body(HomeController controller) {
  return Container(
    child: Observer(builder: (_) {
      return ListView.builder(
        itemCount: controller.pokemonStore.pokemonsFiltered.length,
        itemBuilder: (context, index) {
          PokemonModel item = controller.pokemonStore.pokemonsFiltered[index];
          return ListTile(
            leading: Image.network(item.imageUrl),
            title: Text(item.name),
            subtitle: Text(
              '#${item.id.toString().padLeft(2, '0')}',
            ),
          );
        },
      );
    }),
  );
}
