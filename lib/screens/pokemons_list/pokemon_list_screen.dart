import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_digital_solutions/screens/custom_widgets/failed_text_widget.dart';
import 'package:pokemon_digital_solutions/screens/custom_widgets/loading_widget.dart';
import 'package:pokemon_digital_solutions/screens/pokemons_list/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_digital_solutions/screens/pokemons_list/bloc/pokemon_list_event.dart';
import 'package:pokemon_digital_solutions/screens/pokemons_list/bloc/pokemon_list_state.dart';
import 'package:pokemon_digital_solutions/screens/pokemons_list/pokemon_grid_widget.dart';

class PokemonListScreen extends StatelessWidget {
  static get name => 'Pokemon List';
  static get path => '/pokemons';

  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('P0k3m0nS'),
      ),
      body: BlocBuilder<PokemonListBloc, PokemonListState>(
          bloc: context.read<PokemonListBloc>()..add(PokemonListRequest()),
          builder: (context, state) {
            if (state is PokemonListLoadInProgress) {
              return const LoadingWidget();
            } else if (state is PokemonListLoadSuccess) {
              return PokemonGridWidget(pokemons: state.pokemonsList);
            } else if (state is PokemonListLoadFailed) {
              return FailedText(errorMessage: state.error.toString());
            } else {
              return const Center(
                child: FailedText(errorMessage: "Unexpected state"),
              );
            }
          }),
    );
  }
}
