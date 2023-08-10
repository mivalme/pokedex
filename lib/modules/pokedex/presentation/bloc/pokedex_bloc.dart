import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/modules/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/modules/pokedex/infrastructure/datasources/isar_datasource_impl.dart';
import 'package:pokedex/modules/pokedex/infrastructure/datasources/pokemon_remote_datasource_impl.dart';
import 'package:pokedex/modules/pokedex/infrastructure/repositories/pokemon_repository_impl.dart';

part 'pokedex_event.dart';
part 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  final _pokemonRepository = PokemonRepositoryImpl(
      PokemonRemoteDatasourceImpl(), IsarDatasourceImpl());

  PokedexBloc()
      : super(const PokedexState(
          pokemons: [],
          selectedPokemon: null,
          currentPage: 0,
          isLoading: false,
          isFiltered: false,
        )) {
    on<FetchPokemonsEvent>(_onFetchPokemons);
    on<SelectPokemonEvent>(_onSelectPokemon);
    on<FilterPokemonsEvent>(_onFilterPokemons);
    on<UpdatePokemonImageEvent>(_onUpdatePokemonImage);
  }

  void _onFetchPokemons(
      FetchPokemonsEvent event, Emitter<PokedexState> emit) async {
    if (state.isLoading || state.isFiltered) return;

    emit(state.copyWith(isLoading: true));

    final pokemons =
        await _pokemonRepository.fetchPokemonList(state.currentPage * 20, 20);

    emit(
      state.copyWith(
        pokemons: [...state.pokemons, ...pokemons],
        currentPage: state.currentPage + 1,
        isLoading: false,
      ),
    );
  }

  void _onSelectPokemon(
      SelectPokemonEvent event, Emitter<PokedexState> emit) async {
    final pokemon = await _pokemonRepository.getPokemon(event.pokemonId);
    emit(state.copyWith(
      selectedPokemon: pokemon,
    ));
  }

  void _onFilterPokemons(
      FilterPokemonsEvent event, Emitter<PokedexState> emit) async {
    final pokemons =
        await _pokemonRepository.fetchPokemonList(0, state.currentPage * 20);

    final filteredPokemons = pokemons
        .where((e) => e.name.toLowerCase().contains(event.query.toLowerCase()));

    emit(state.copyWith(
      pokemons: filteredPokemons.toList(),
      isFiltered: event.query.isNotEmpty,
    ));
  }

  void _onUpdatePokemonImage(
      UpdatePokemonImageEvent event, Emitter<PokedexState> emit) async {
    final pokemon = state.selectedPokemon;
    if (pokemon == null) return;
    await _pokemonRepository.updatePokemonImage(pokemon.id, event.image);

    emit(state.copyWith(
        pokemons: state.pokemons.map((e) {
          return e.id == pokemon.id ? e.copyWith(image: event.image) : e;
        }).toList(),
        selectedPokemon: pokemon.copyWith(image: event.image)));
  }
}
