import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/modules/pokedex/presentation/bloc/pokedex_bloc.dart';
import 'package:pokedex/modules/pokedex/presentation/widgets/pokemon_masonry.dart';
import 'package:pokedex/modules/shared/shared.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PokedexBloc()..add(FetchPokemonsEvent()),
      child: const _PokedexView(),
    );
  }
}

class _PokedexView extends StatelessWidget {
  const _PokedexView();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final pokemons = context.watch<PokedexBloc>().state.pokemons;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex', style: textStyles.headlineMedium),
      ),
      drawer: const SideMenu(),
      body: pokemons.isEmpty
          ? const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : PokemonMasonry(
              pokemons: pokemons,
              loadNextPage: () =>
                  context.read<PokedexBloc>().add(FetchPokemonsEvent()),
            ),
    );
  }
}
