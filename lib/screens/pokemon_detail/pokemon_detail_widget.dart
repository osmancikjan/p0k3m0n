import 'package:flutter/material.dart';
import 'package:pokemon_digital_solutions/models/pokemon_details_model.dart';
import 'package:pokemon_digital_solutions/screens/custom_widgets/flexible_network_image_widget.dart';
import 'package:pokemon_digital_solutions/screens/custom_widgets/flexible_text_widget.dart';

class PokemonDetailsWidget extends StatelessWidget {
  final PokemonDetailsModel details;

  const PokemonDetailsWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlexibleNetworkImage(details.imageUrl),
        FlexibleText(details.name),
        FlexibleText('Height: ${details.height.toString()}'),
        FlexibleText('Weight: ${details.weight.toString()}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _typesRowBuilder(details.types),
        )
      ],
    );
  }

  List<Widget> _typesRowBuilder(List<String> types) {
    List<Widget> result = [];

    for (var type in types) {
      result.add(Text(type));
    }

    return result;
  }
}
