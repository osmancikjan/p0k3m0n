abstract class PokemonDetailEvent {}

class PokemonDetailRequest extends PokemonDetailEvent {
  final int pokemonId;

  PokemonDetailRequest({required this.pokemonId});
}
