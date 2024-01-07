import 'package:pokemon_digital_solutions/models/pokemon_list_item_model.dart';

abstract class PokemonListState {}

class PokemonListInitial extends PokemonListState {}

class PokemonListLoadInProgress extends PokemonListState {}

class PokemonListLoadFailed extends PokemonListState {
  final Error error;

  PokemonListLoadFailed({required this.error});
}

class PokemonListLoadSuccess extends PokemonListState {
  final List<PokemonListItemModel> pokemonsList;

  PokemonListLoadSuccess(this.pokemonsList);
}
