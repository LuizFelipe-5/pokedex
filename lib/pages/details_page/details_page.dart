import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/shared/stores/pokemon_store.dart';
import 'package:pokedex/utils/colors.dart';

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

  late Size size;

  var _pageController = PageController();

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _pageController.jumpToPage(indexCurrentPokemon);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: widget.store.pokemonSelected.types.first.avatarColor,
        appBar: AppBar(
          backgroundColor: widget.store.pokemonSelected.types.first.avatarColor,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: size.height * .3,
                  color: widget.store.pokemonSelected.types.first.avatarColor,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    height: size.height * .7,
                    width: size.width,
                    child: Container(
                      margin: EdgeInsets.only(top: 50, bottom: 30),
                      child: Column(
                        children: [
                          Text(
                            widget.store.pokemonSelected.name,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.store.pokemonSelected.types
                                  .map<Widget>((e) => Container(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Chip(
                                          backgroundColor: e.avatarColor,
                                          avatar: SvgPicture.asset(e.imagePath),
                                          elevation: 4,
                                          label: Text(
                                            e.name,
                                            style: TextStyle(color: white),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            PageView.builder(
              controller: _pageController,
              itemCount: widget.pokemons.length,
              onPageChanged: (int page) {
                widget.store.setPokemonSelected(pokemons[page]);
              },
              scrollBehavior: ScrollBehavior(),
              itemBuilder: (context, index) {
                return Hero(
                  tag: widget.store.pokemonSelected.imageUrl,
                  child: Container(
                    transform: Matrix4.translationValues(
                      0.0,
                      -size.height / 5,
                      0.0,
                    ),
                    child: Image.network(
                      widget.store.pokemonSelected.imageUrl,
                      scale: 3,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
