import 'package:flutter/material.dart';
import 'package:pokemon_digital_solutions/router.dart';
import 'package:pokemon_digital_solutions/screens/pokemons_list/pokemon_list_screen.dart';

class HomeScreen extends StatelessWidget {
  static get name => 'HomeScreen';
  static get path => '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'P0k3m0nS',
            style: TextStyle(
              fontSize: 36,
              color: Colors.orangeAccent,
            ),
          ),
          const Flexible(
            child: Text(
                'Simple Pokemon application that shows you list of Pokemons and then you can tap on one of them to get details about your favourite pokemon. Pokemons persits at local storage too.'),
          ),
          MaterialButton(
            color: Colors.orangeAccent,
            onPressed: () => router.push(PokemonListScreen.path),
            child: const Text('Explore Pokemons'),
          ),
        ],
      ),
    ));
  }
}
