import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(builder: (_) {
        controller.pokemonStore.pokemonSelected;
        return ListView.separated(
          separatorBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                color: controller.pokemonStore.pokemonSelected ==
                        controller.pokemonStore.pokemons[index]
                    ? primaryColor0
                    : white,
                child: Divider(
                  color: divider,
                  height: 5,
                  thickness: 1,
                ),
              ),
            );
          },
          itemCount: controller.pokemonStore.pokemonsFiltered.length,
          itemBuilder: (context, index) {
            final pokemon = controller.pokemonStore.pokemonsFiltered[index];
            return Container(
              color: controller.pokemonStore.pokemonSelected == pokemon
                  ? primaryColor0
                  : white,
              child: ListTile(
                onTap: () {
                  controller.pokemonStore.setPokemonSelected(pokemon);
                },
                leading: Image.network(pokemon.imageUrl),
                title: Text(pokemon.name),
                subtitle: Text(
                  '#${pokemon.id.toString().padLeft(3, '0')}',
                ),
                trailing: Container(
                  width: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: pokemon.types.length,
                    itemBuilder: (context, index) {
                      final type = pokemon.types[index];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: mono,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                            backgroundColor: type.avatarColor,
                            child: SvgPicture.asset(type.imagePath)),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
