import 'package:isar/isar.dart';

part 'pokemon_details_model.g.dart';

@collection
@Name('PokemonDetailedInfo')
class PokemonDetailsModel {
  final Id id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int height;
  final int weight;

  PokemonDetailsModel(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.types,
      required this.height,
      required this.weight});

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    final types = (json['types'] as List)
        .map((typeJson) => typeJson['type']['name'] as String)
        .toList();

    return PokemonDetailsModel(
        id: json['id'],
        name: json['name'],
        imageUrl: json['sprites']['front_default'],
        types: types,
        height: json['height'],
        weight: json['weight']);
  }
}
