import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pokedex/modules/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/modules/pokedex/presentation/widgets/pokemon_list_link.dart';

class PokemonMasonry extends StatefulWidget {
  final List<Pokemon> pokemons;
  final VoidCallback? loadNextPage;

  const PokemonMasonry({
    super.key,
    required this.pokemons,
    this.loadNextPage
  });

  @override
  State<PokemonMasonry> createState() => _PokemonMasonryState();
}

class _PokemonMasonryState extends State<PokemonMasonry> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if ((scrollController.position.pixels + 100) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: scrollController,
      crossAxisCount: 2,
      itemCount: widget.pokemons.length,
      itemBuilder: (_, index) =>
          PokemonListLink(pokemon: widget.pokemons[index]),
    );
  }
}