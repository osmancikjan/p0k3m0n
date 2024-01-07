import 'package:isar/isar.dart';

part 'pokemon_list_item_model.g.dart';

@collection
@Name('PokemonBasicInfo')
class PokemonListItemModel {
  final Id id;
  final String name;

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/$id.png';

  PokemonListItemModel({required this.id, required this.name});

  factory PokemonListItemModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return PokemonListItemModel(id: id, name: name);
  }
}
