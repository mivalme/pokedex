import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/modules/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/modules/pokedex/infrastructure/datasources/pokemon_remote_datasource_impl.dart';
import 'package:pokedex/modules/pokedex/infrastructure/repositories/pokemon_repository_impl.dart';

part 'pokedex_event.dart';
part 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  final _pokemonRepository =
      PokemonRepositoryImpl(PokemonRemoteDatasourceImpl());

  PokedexBloc()
      : super(const PokedexState(
          pokemons: [],
          currentPage: 0,
          isLoading: false,
        )) {
    on<FetchPokemonsEvent>(_onFetchPokemons);
  }

  void _onFetchPokemons(
      FetchPokemonsEvent event, Emitter<PokedexState> emit) async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final pokemons =
        await _pokemonRepository.fetchPokemonList(state.currentPage * 20, 20);

    emit(state.copyWith(
      pokemons: [...state.pokemons, ...pokemons],
      currentPage: state.currentPage + 1,
      isLoading: false,
    ));
  }
}
