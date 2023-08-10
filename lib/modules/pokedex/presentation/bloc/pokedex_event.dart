part of 'pokedex_bloc.dart';

abstract class PokedexEvent extends Equatable {
  const PokedexEvent();

  @override
  List<Object> get props => [];
}

class FetchPokemonsEvent extends PokedexEvent {}

class SelectPokemonEvent extends PokedexEvent {
  final String pokemonId;

  const SelectPokemonEvent({required this.pokemonId});
}

class FilterPokemonsEvent extends PokedexEvent {
  final String query;

  const FilterPokemonsEvent({required this.query});
}
