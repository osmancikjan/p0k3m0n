import 'package:go_router/go_router.dart';
import 'package:pokemon_digital_solutions/screens/home/home_screen.dart';
import 'package:pokemon_digital_solutions/screens/pokemons_list/pokemon_list_screen.dart';
import 'package:pokemon_digital_solutions/screens/pokemon_detail/pokemon_detail_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: HomeScreen.path,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: PokemonListScreen.name,
      path: PokemonListScreen.path,
      builder: (context, state) => const PokemonListScreen(),
    ),
    GoRoute(
        name: PokemonDetailScreen.name,
        path: PokemonDetailScreen.path + ':pokemonId',
        builder: (context, state) {
          int pokemonId = int.parse(state.pathParameters['pokemonId'] ?? '');
          return PokemonDetailScreen(pokemonId: pokemonId);
        }),
  ],
);
