import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_digital_solutions/models/pokemon_details_model.dart';
import 'package:pokemon_digital_solutions/repository/repository.dart';
import 'package:pokemon_digital_solutions/screens/pokemon_detail/bloc/pokemon_detail_event.dart';
import 'package:pokemon_digital_solutions/screens/pokemon_detail/bloc/pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  late RepositoryImpl _repository;

  PokemonDetailBloc(RepositoryImpl repository) : super(PokemonDetailInitial()) {
    _repository = repository;
    on<PokemonDetailRequest>(_onPokemonDetailRequest);
  }

  Future<void> _onPokemonDetailRequest(
      PokemonDetailRequest event, Emitter<PokemonDetailState> emit) async {
    emit(PokemonDetailLoadInProgress());

    try {
      PokemonDetailsModel? pokemon =
          await _repository.getPokemonDetails(event.pokemonId);
      if (pokemon != null) {
        emit(PokemonDetailLoadSuccess(pokemonDetail: pokemon));
      } else {
        emit(PokemonDetailLoadFailed(error: throw ('Details not found!')));
      }
    } on Error catch (e, _) {
      emit(PokemonDetailLoadFailed(error: e));
    }
  }
}
