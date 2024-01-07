import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_digital_solutions/models/pokemon_details_model.dart';
import 'package:pokemon_digital_solutions/models/pokemon_list_item_model.dart';

class ApiService {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<List<PokemonListItemModel>> getPokemonList() async {
    const int limit = 1000;
    const int offset = 0;

    final queryParams = {'limit': '$limit', 'offset': '$offset'};

    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParams);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    final List<PokemonListItemModel> listOfPokemons = (json['results'] as List)
        .map((pokemonData) => PokemonListItemModel.fromJson(pokemonData))
        .toList();

    return listOfPokemons;
  }

  Future<PokemonDetailsModel> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');

    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return PokemonDetailsModel.fromJson(json);
  }
}
