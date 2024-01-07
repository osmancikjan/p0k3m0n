import 'package:pokemon_digital_solutions/models/pokemon_details_model.dart';
import 'package:pokemon_digital_solutions/models/pokemon_list_item_model.dart';
import 'package:pokemon_digital_solutions/repository/api_service.dart';
import 'package:pokemon_digital_solutions/repository/isar_service.dart';

final class RepositoryImpl {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  RepositoryImpl(this._remoteDataSource, this._localDataSource);

  Future<List<PokemonListItemModel>> getPokemonList() async {
    try {
      List<PokemonListItemModel> pokemonListResponse =
          await _localDataSource.getPokemonListFromCache();
      if (pokemonListResponse.isEmpty) {
        pokemonListResponse = await _remoteDataSource.getPokemonListFromApi();
        await _localDataSource.savePokemonList(pokemonListResponse);
      }

      return Future.value(pokemonListResponse);
    } on Error catch (e) {
      return Future.error(e);
    }
  }

  Future<PokemonDetailsModel?> getPokemonDetails(int pokemonId) async {
    try {
      PokemonDetailsModel? pokemonDetails =
          await _localDataSource.getPokemonDetailsFromCache(pokemonId);
      if (pokemonDetails == null) {
        pokemonDetails =
            await _remoteDataSource.getPokemonDetailsFromApi(pokemonId);
        await _localDataSource.savePokemonDetails(pokemonDetails);
      }

      return Future.value(pokemonDetails);
    } on Error catch (e) {
      return Future.error(e);
    }
  }
}

abstract class RemoteDataSource {
  Future<List<PokemonListItemModel>> getPokemonListFromApi();

  Future<PokemonDetailsModel> getPokemonDetailsFromApi(int pokemonId);
}

abstract class LocalDataSource {
  Future<List<PokemonListItemModel>> getPokemonListFromCache();

  Future<void> savePokemonList(List<PokemonListItemModel> pokemons);

  Future<PokemonDetailsModel?> getPokemonDetailsFromCache(int pokemonId);

  Future<void> savePokemonDetails(PokemonDetailsModel details);
}

final class RemoteDataSourceImpl extends RemoteDataSource {
  final _apiService = ApiService();

  @override
  Future<List<PokemonListItemModel>> getPokemonListFromApi() {
    return _apiService.getPokemonList();
  }

  @override
  Future<PokemonDetailsModel> getPokemonDetailsFromApi(int pokemonId) {
    return _apiService.getPokemonInfo(pokemonId);
  }
}

final class LocalDataSourceImpl extends LocalDataSource {
  final _isarService = IsarService();

  @override
  Future<List<PokemonListItemModel>> getPokemonListFromCache() {
    return _isarService.getPokemonList();
  }

  @override
  Future<void> savePokemonList(List<PokemonListItemModel> pokemons) {
    return _isarService.storePokemonList(pokemons);
  }

  @override
  Future<PokemonDetailsModel?> getPokemonDetailsFromCache(int pokemonId) {
    return _isarService.getPokemonDetails(pokemonId);
  }

  @override
  Future<void> savePokemonDetails(PokemonDetailsModel details) {
    return _isarService.storePokemonDetails(details);
  }
}
