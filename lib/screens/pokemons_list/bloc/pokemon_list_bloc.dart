import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_digital_solutions/models/pokemon_list_item_model.dart';

import 'package:pokemon_digital_solutions/repository/repository.dart';
import 'package:pokemon_digital_solutions/screens/pokemons_list/bloc/pokemon_list_event.dart';
import 'package:pokemon_digital_solutions/screens/pokemons_list/bloc/pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  late final RepositoryImpl _repository;

  PokemonListBloc(RepositoryImpl repository) : super(PokemonListInitial()) {
    _repository = repository;
    on<PokemonListRequest>(_onPokemonListRequest);
  }

  Future<void> _onPokemonListRequest(
      PokemonListRequest event, Emitter<PokemonListState> emit) async {
    emit(PokemonListLoadInProgress());

    try {
      List<PokemonListItemModel> pokemons = await _repository.getPokemonList();
      emit(PokemonListLoadSuccess(pokemons));
    } on Error catch (e, _) {
      emit(PokemonListLoadFailed(error: e));
    }
  }
}
