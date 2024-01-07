import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokemon_digital_solutions/models/pokemon_details_model.dart';
import 'package:pokemon_digital_solutions/models/pokemon_list_item_model.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [
          PokemonDetailsModelSchema,
          PokemonListItemModelSchema,
        ],
        directory: dir.path,
        inspector: true,
      );

      return isar;
    }

    return Future.value(Isar.getInstance());
  }

  Future<List<PokemonListItemModel>> getPokemonList() async {
    final isar = await db;
    return isar.pokemonListItemModels.where().findAll();
  }

  Future<PokemonDetailsModel?> getPokemonDetails(Id pokemonId) async {
    final isar = await db;
    return isar.pokemonDetailsModels.get(pokemonId);
  }

  Future<void> storePokemonList(List<PokemonListItemModel> pokemons) async {
    final isar = await db;

    await isar.writeTxn(() async {
      await isar.pokemonListItemModels.putAll(pokemons);
    });
  }

  Future<void> storePokemonDetails(PokemonDetailsModel details) async {
    final isar = await db;

    await isar.writeTxn(() async {
      final itemToUpdate = await isar.pokemonDetailsModels.get(details.id);

      if (itemToUpdate != null) {
        await isar.pokemonDetailsModels.put(details);
      } else {
        await isar.pokemonDetailsModels.put(details);
      }
    });
  }
}
