import 'package:pokemon_digital_solutions/models/pokemon_details_model.dart';

abstract class PokemonDetailState {}

class PokemonDetailInitial extends PokemonDetailState {}

class PokemonDetailLoadInProgress extends PokemonDetailState {}

class PokemonDetailLoadFailed extends PokemonDetailState {
  final Error error;

  PokemonDetailLoadFailed({required this.error});
}

class PokemonDetailLoadSuccess extends PokemonDetailState {
  final PokemonDetailsModel pokemonDetail;

  PokemonDetailLoadSuccess({required this.pokemonDetail});
}
