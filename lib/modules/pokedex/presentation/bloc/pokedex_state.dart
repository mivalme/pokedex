part of 'pokedex_bloc.dart';

class PokedexState extends Equatable {
  final List<Pokemon> pokemons;
  final int currentPage;
  final bool isLoading;

  const PokedexState({
    required this.pokemons,
    required this.currentPage,
    required this.isLoading,
  });

  PokedexState copyWith({
    List<Pokemon>? pokemons,
    int? currentPage,
    bool? isLoading,
  }) =>
      PokedexState(
        pokemons: pokemons ?? this.pokemons,
        currentPage: currentPage ?? this.currentPage,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [pokemons, currentPage, isLoading];
}
