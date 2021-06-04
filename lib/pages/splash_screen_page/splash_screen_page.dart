import 'package:flutter/material.dart';
import 'package:pokedex/pages/home_page/home_page.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    getPokemons();
    super.initState();
  }

  getPokemons() async {
    final repository = PokemonRepository();

    final pokemons = await repository.getPokemons();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage(pokemons)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(),
    );
  }
}
