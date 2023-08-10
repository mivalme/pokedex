import 'dart:typed_data';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/modules/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/modules/pokedex/presentation/bloc/pokedex_bloc.dart';

class PokemonListLink extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonListLink({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: FadeIn(
        child: GestureDetector(
          onTap: () {
            context.push('/pokemon/${pokemon.id}');
            context
                .read<PokedexBloc>()
                .add(SelectPokemonEvent(pokemonId: pokemon.id));
          },
          child: SizedBox(
            width: size.width * 0.4,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: pokemon.types.first.type?.typeColor,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pokemon.name.toUpperCase(),
                      style: textStyles.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        _PokemonTypesView(
                            types: pokemon.types
                                .map((e) => e.type?.name)
                                .toList()),
                        const Spacer(),
                        Image.memory(
                          Uint8List.fromList(pokemon.image),
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Placeholder(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: types
          .take(2)
          .map((e) => Column(
                children: [
                  const SizedBox(height: 5),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white12,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 1.2,
                      ),
                      child: Text(
                        e?.name.toString() ?? '',
                        style: textStyles.labelMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ))
          .toList(),
    );
  }
}
