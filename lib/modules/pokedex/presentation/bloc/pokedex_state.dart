part of 'pokedex_bloc.dart';

class PokedexState extends Equatable {
  final List<Pokemon> pokemons;
  final Pokemon? selectedPokemon;
  final int currentPage;
  final bool isLoading;
  final bool isFiltered;

  const PokedexState({
    required this.pokemons,
    required this.selectedPokemon,
    required this.currentPage,
    required this.isLoading,
    required this.isFiltered,
  });

  PokedexState copyWith({
    List<Pokemon>? pokemons,
    Pokemon? selectedPokemon,
    int? currentPage,
    bool? isLoading,
    bool? isFiltered,
    ScrollController? scrollController,
  }) =>
      PokedexState(
        pokemons: pokemons ?? this.pokemons,
        selectedPokemon: selectedPokemon ?? this.selectedPokemon,
        currentPage: currentPage ?? this.currentPage,
        isLoading: isLoading ?? this.isLoading,
        isFiltered: isFiltered ?? this.isFiltered,
      );

  @override
  List<Object?> get props =>
      [pokemons, selectedPokemon, currentPage, isLoading, isFiltered];
}
