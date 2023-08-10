import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/modules/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/modules/pokedex/presentation/bloc/pokedex_bloc.dart';

class PokemonDetailScreen extends StatelessWidget {
  final String pokemonId;

  const PokemonDetailScreen({
    super.key,
    required this.pokemonId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          PokedexBloc()..add(SelectPokemonEvent(pokemonId: pokemonId)),
      child: const _PokemonDetailView(),
    );
  }
}

class _PokemonDetailView extends StatelessWidget {
  const _PokemonDetailView();

  @override
  Widget build(BuildContext context) {
    final pokemon = context.watch<PokedexBloc>().state.selectedPokemon;
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    if (pokemon == null) {
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _PokemonDetailSliverAppBar(pokemon: pokemon),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10,
                            offset: Offset(0, 10),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text('Abilities', style: textStyles.titleLarge),
                            const SizedBox(width: 16),
                            Wrap(
                              spacing: 16,
                              children: [
                                ...pokemon.abilities.map((e) {
                                  return Text(
                                    e.ability?.name ?? '',
                                    style: textStyles.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10,
                            offset: Offset(0, 10),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: size.width * 0.3,
                              child: Column(
                                children: [
                                  Text('Height:',
                                      style: textStyles.titleMedium),
                                  Text('${pokemon.height / 10} m',
                                      style: textStyles.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w800)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            SizedBox(
                              width: size.width * 0.3,
                              child: Column(
                                children: [
                                  Text('Weight:',
                                      style: textStyles.titleMedium),
                                  Text('${pokemon.weight / 10} Kg',
                                      style: textStyles.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w800)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 10,
                              offset: Offset(0, 10),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Base Stats', style: textStyles.titleLarge),
                              const SizedBox(height: 16),
                              ...pokemon.stats.map((e) {
                                return Row(
                                  children: [
                                    Text(e.stat?.name ?? ''),
                                    const Spacer(),
                                    Text('${e.baseStat}'),
                                    const SizedBox(width: 16),
                                    SizedBox(
                                        width: size.width * 0.4,
                                        child: LinearProgressIndicator(
                                            value: (e.baseStat! / 100)))
                                  ],
                                );
                              })
                            ],
                          ),
                        ))
                  ],
                ),
              );
            },
            childCount: 1,
          ))
        ],
      ),
    );
  }
}

class _PokemonDetailSliverAppBar extends StatelessWidget {
  final Pokemon pokemon;
  const _PokemonDetailSliverAppBar({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return SliverAppBar(
      pinned: true,
      expandedHeight: size.height * 0.4,
      backgroundColor: pokemon.types.first.type?.typeColor,
      title: Text(
        pokemon.name.toUpperCase(),
        style: textStyles.headlineMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(top: size.height * 0.15),
        title: Image.memory(
          Uint8List.fromList(pokemon.image),
          height: 180,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Placeholder(),
        ),
        background: Padding(
          padding: EdgeInsets.only(top: size.height * 0.16),
          child: Column(
            children: [
              _PokemonTypesView(
                  types: pokemon.types.map((e) => e.type?.name).toList()),
            ],
          ),
        ),
      ),
    );
  }
}

class _PokemonTypesView extends StatelessWidget {
  final List<PokemonTypeEnum?> types;

  const _PokemonTypesView({required this.types});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: types.take(2).map((e) {
        return Row(
          children: [
            const SizedBox(width: 16),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white10,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  e?.name.toString() ?? '',
                  style: textStyles.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
