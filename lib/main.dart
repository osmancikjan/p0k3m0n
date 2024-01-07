import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_digital_solutions/repository/repository.dart';
import 'package:pokemon_digital_solutions/router.dart';
import 'package:pokemon_digital_solutions/screens/pokemon_detail/bloc/pokemon_detail_bloc.dart';
import 'package:pokemon_digital_solutions/screens/pokemons_list/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_digital_solutions/screens/pokemons_list/bloc/pokemon_list_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          RepositoryImpl(RemoteDataSourceImpl(), LocalDataSourceImpl()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PokemonListBloc>(
            create: (context) => PokemonListBloc(
              context.read<RepositoryImpl>(),
            )..add(PokemonListRequest()),
          ),
          BlocProvider<PokemonDetailBloc>(
            create: (context) => PokemonDetailBloc(
              context.read<RepositoryImpl>(),
            ),
          ),
        ],
        child: MaterialApp.router(
            routerConfig: router,
            title: 'P0k3m0nS',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
              useMaterial3: true,
            )),
      ),
    );
  }
}
