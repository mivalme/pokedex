import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/helpers/camera_gallery_service_impl.dart';
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
    return _PokemonDetailView(pokemonId);
  }
}

class _PokemonDetailView extends StatelessWidget {
  final String pokemonId;
  const _PokemonDetailView(this.pokemonId);

  @override
  Widget build(BuildContext context) {
    final pokemon = context.watch<PokedexBloc>().state.selectedPokemon;
    final colors = Theme.of(context).colorScheme;

    final commonDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: colors.secondaryContainer,
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 10),
        )
      ],
    );

    if (pokemon == null) {
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    return Scaffold(
      body: Container(
        color: colors.secondaryContainer,
        child: CustomScrollView(
          // physics: const ClampingScrollPhysics(),
          slivers: [
            _PokemonDetailSliverAppBar(pokemon: pokemon),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _MainInfoView(
                        commonDecoration: commonDecoration,
                        pokemon: pokemon,
                      ),
                      const SizedBox(height: 32),
                      _HealthInfoView(
                        commonDecoration: commonDecoration,
                        pokemon: pokemon,
                      ),
                      const SizedBox(height: 32),
                      _StatsInfoView(
                        commonDecoration: commonDecoration,
                        pokemon: pokemon,
                      ),
                      const SizedBox(height: 32),
                      _AbilitiesView(
                        commonDecoration: commonDecoration,
                        pokemon: pokemon,
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ))
          ],
        ),
      ),
    );
  }
}

class _AbilitiesView extends StatelessWidget {
  final BoxDecoration commonDecoration;
  final Pokemon pokemon;

  const _AbilitiesView({
    required this.commonDecoration,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: commonDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Abilities',
                style:
                    textStyles.titleLarge?.copyWith(color: colors.secondary)),
            const SizedBox(width: 16),
            Wrap(
              spacing: 16,
              children: [
                ...pokemon.abilities.map((e) {
                  return Text(
                    e.ability?.name ?? '',
                    style: textStyles.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700, color: colors.primary),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsInfoView extends StatelessWidget {
  final BoxDecoration commonDecoration;
  final Pokemon pokemon;

  const _StatsInfoView({
    required this.commonDecoration,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return DecoratedBox(
        decoration: commonDecoration,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Base Stats',
                  style:
                      textStyles.titleLarge?.copyWith(color: colors.primary)),
              const SizedBox(height: 16),
              ...pokemon.stats.map((e) {
                return Row(
                  children: [
                    Text(
                      e.stat?.name ?? '',
                      style: textStyles.bodyMedium
                          ?.copyWith(color: colors.secondary),
                    ),
                    const Spacer(),
                    Text(
                      '${e.baseStat}',
                      style:
                          textStyles.bodyLarge?.copyWith(color: colors.primary),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                        width: size.width * 0.4,
                        child:
                            LinearProgressIndicator(value: (e.baseStat! / 100)))
                  ],
                );
              })
            ],
          ),
        ));
  }
}

class _HealthInfoView extends StatelessWidget {
  final BoxDecoration commonDecoration;
  final Pokemon pokemon;

  const _HealthInfoView({
    required this.commonDecoration,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: commonDecoration,
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
                      style: textStyles.titleMedium
                          ?.copyWith(color: colors.secondary)),
                  Text(
                    '${pokemon.height / 10} m',
                    style: textStyles.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w800, color: colors.primary),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: size.width * 0.3,
              child: Column(
                children: [
                  Text('Weight:',
                      style: textStyles.titleMedium
                          ?.copyWith(color: colors.secondary)),
                  Text(
                    '${pokemon.weight / 10} Kg',
                    style: textStyles.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: colors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainInfoView extends StatelessWidget {
  final BoxDecoration commonDecoration;
  final Pokemon pokemon;

  const _MainInfoView({
    required this.commonDecoration,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: commonDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text('Identifier Number:',
                    style: textStyles.titleMedium
                        ?.copyWith(color: colors.secondary)),
                const SizedBox(width: 16),
                Text('#${pokemon.id}',
                    style: textStyles.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w800, color: colors.primary)),
              ],
            ),
            Row(
              children: [
                Text('Official Name:',
                    style: textStyles.titleMedium
                        ?.copyWith(color: colors.secondary)),
                const SizedBox(width: 16),
                Text(pokemon.name,
                    style: textStyles.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w800, color: colors.primary)),
              ],
            )
          ],
        ),
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
    final readPokedexBloc = context.read<PokedexBloc>();
    final colors = Theme.of(context).colorScheme;

    return SliverAppBar(
      pinned: true,
      expandedHeight: size.height * 0.4,
      backgroundColor: pokemon.types.first.type?.typeColor,
      title: Text(
        pokemon.name.toUpperCase(),
        style: textStyles.headlineMedium?.copyWith(
          color: colors.secondaryContainer,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          color: colors.secondaryContainer,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      actions: [
        IconButton(
            onPressed: () async {
              final image = await CameraGalleryServiceImpl().selectPhoto();
              if (image == null) return;
              readPokedexBloc.add(UpdatePokemonImageEvent(image: image));
            },
            icon: Icon(
              Icons.photo_library_rounded,
              color: colors.secondaryContainer,
            )),
        IconButton(
            onPressed: () async {
              final image = await CameraGalleryServiceImpl().takePhoto();
              if (image == null) return;
              readPokedexBloc.add(UpdatePokemonImageEvent(image: image));
            },
            icon: Icon(
              Icons.camera_alt_outlined,
              color: colors.secondaryContainer,
            )),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.only(top: size.height * 0.15),
        title: Image.memory(
          Uint8List.fromList(pokemon.image),
          height: size.height * 0.18,
          width: size.height * 0.18,
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
    final colors = Theme.of(context).colorScheme;

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
                    color: colors.secondaryContainer,
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
