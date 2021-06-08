import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/models/pokemon_model.dart';

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
        return ListView.separated(
          separatorBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                child: Divider(
                  height: 5,
                  thickness: 1,
                ),
              ),
            );
          },
          itemCount: controller.pokemonStore.pokemonsFiltered.length,
          itemBuilder: (context, index) {
            PokemonModel item = controller.pokemonStore.pokemonsFiltered[index];
            return ListTile(
              leading: Image.network(item.imageUrl),
              title: Text(item.name),
              subtitle: Text(
                '#${item.id.toString().padLeft(3, '0')}',
              ),
              trailing: Container(
                color: Colors.red,
                child: SvgPicture.asset('assets/types/bug.svg'),
              ),
            );
          },
        );
      }),
    );
  }
}