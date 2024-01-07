import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_digital_solutions/screens/custom_widgets/failed_text_widget.dart';
import 'package:pokemon_digital_solutions/screens/custom_widgets/loading_widget.dart';
import 'package:pokemon_digital_solutions/screens/pokemon_detail/bloc/pokemon_detail_bloc.dart';
import 'package:pokemon_digital_solutions/screens/pokemon_detail/bloc/pokemon_detail_event.dart';
import 'package:pokemon_digital_solutions/screens/pokemon_detail/bloc/pokemon_detail_state.dart';
import 'package:pokemon_digital_solutions/screens/pokemon_detail/pokemon_detail_widget.dart';

class PokemonDetailScreen extends StatelessWidget {
  static get name => 'Pokemon Details';
  static get path => '/pokemons/detail/';

  const PokemonDetailScreen({super.key, required this.pokemonId});

  final int pokemonId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('P0k3m0nS'),
      ),
      body: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
          bloc: context.read<PokemonDetailBloc>()
            ..add(PokemonDetailRequest(pokemonId: pokemonId)),
          builder: (context, state) {
            if (state is PokemonDetailLoadSuccess) {
              return PokemonDetailsWidget(details: state.pokemonDetail);
            } else if (state is PokemonDetailLoadInProgress) {
              return const LoadingWidget();
            } else if (state is PokemonDetailLoadFailed) {
              return FailedText(errorMessage: state.error.toString());
            } else {
              return const FailedText(errorMessage: 'Unexpected state');
            }
          }),
    );
  }
}
