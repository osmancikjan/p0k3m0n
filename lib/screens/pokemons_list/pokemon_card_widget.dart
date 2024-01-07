import 'package:flutter/material.dart';
import 'package:pokemon_digital_solutions/screens/custom_widgets/flexible_network_image_widget.dart';
import 'package:pokemon_digital_solutions/screens/custom_widgets/flexible_text_widget.dart';

class PokemonCardWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  const PokemonCardWidget(
      {super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: GridTile(
      header: FlexibleText(
        name,
        textAlign: TextAlign.center,
      ),
      child: FlexibleNetworkImage(imageUrl),
    ));
  }
}
