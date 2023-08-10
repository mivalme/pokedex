import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/modules/pokedex/presentation/bloc/pokedex_bloc.dart';
import 'package:pokedex/modules/pokedex/presentation/widgets/pokemon_masonry.dart';
import 'package:pokedex/modules/shared/shared.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _PokedexView();
  }
}

class _PokedexView extends StatelessWidget {
  const _PokedexView();

  @override
  Widget build(BuildContext context) {
    final pokemons = context.watch<PokedexBloc>().state.pokemons;
    final isFiltered = context.watch<PokedexBloc>().state.isFiltered;
    final isLoading = context.watch<PokedexBloc>().state.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) => context
              .read<PokedexBloc>()
              .add(FilterPokemonsEvent(query: value)),
          decoration: const InputDecoration(hintText: 'Search'),
        ),
      ),
      drawer: const SideMenu(),
      body: pokemons.isEmpty && !isFiltered
          ? const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : PokemonMasonry(
              pokemons: pokemons,
              loadNextPage: () =>
                  context.read<PokedexBloc>().add(FetchPokemonsEvent()),
            ),
      floatingActionButton: isLoading
          ? const FloatingActionButton(
              onPressed: null,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : null,
    );
  }
}
