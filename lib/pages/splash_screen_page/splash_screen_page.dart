import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pages/home_page/home_page.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import 'package:pokedex/utils/colors.dart';

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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primaryColor,
            primaryColor1,
            secondaryColor,
          ],
        ),
      ),
      child: Bounce(
        delay: Duration(seconds: 2),
        infinite: true,
        child: JelloIn(
          duration: Duration(
            seconds: 2,
          ),
          child: Image.asset(
            'assets/images/poke.png',
            scale: 1.2,
          ),
        ),
      ),
    );
  }
}
