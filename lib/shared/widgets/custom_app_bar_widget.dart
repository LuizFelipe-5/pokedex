import 'package:flutter/material.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => Size(300, 125);
}
