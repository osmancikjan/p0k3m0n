import 'package:flutter/material.dart';
import 'package:pokemon_digital_solutions/models/pokemon_list_item_model.dart';
import 'package:pokemon_digital_solutions/router.dart';
import 'package:pokemon_digital_solutions/screens/pokemon_detail/pokemon_detail_screen.dart';
import 'package:pokemon_digital_solutions/screens/pokemons_list/pokemon_card_widget.dart';

class PokemonGridWidget extends StatelessWidget {
  final List<PokemonListItemModel> pokemons;
  const PokemonGridWidget({
    super.key,
    required this.pokemons,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              router.push(
                  PokemonDetailScreen.path + pokemons[index].id.toString());
            },
            child: PokemonCardWidget(
                name: pokemons[index].name, imageUrl: pokemons[index].imageUrl),
          );
        });
  }
}
