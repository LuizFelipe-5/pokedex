// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonStore on _PokemonStoreBase, Store {
  final _$pokemonsAtom = Atom(name: '_PokemonStoreBase.pokemons');

  @override
  ObservableList<PokemonModel> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<PokemonModel> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  final _$pokemonsFilteredAtom =
      Atom(name: '_PokemonStoreBase.pokemonsFiltered');

  @override
  ObservableList<PokemonModel> get pokemonsFiltered {
    _$pokemonsFilteredAtom.reportRead();
    return super.pokemonsFiltered;
  }

  @override
  set pokemonsFiltered(ObservableList<PokemonModel> value) {
    _$pokemonsFilteredAtom.reportWrite(value, super.pokemonsFiltered, () {
      super.pokemonsFiltered = value;
    });
  }

  final _$_PokemonStoreBaseActionController =
      ActionController(name: '_PokemonStoreBase');

  @override
  void setListPokemon(List<PokemonModel> value) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.setListPokemon');
    try {
      return super.setListPokemon(value);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListPokemonFiltered(List<PokemonModel> value) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.setListPokemonFiltered');
    try {
      return super.setListPokemonFiltered(value);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
pokemonsFiltered: ${pokemonsFiltered}
    ''';
  }
}
