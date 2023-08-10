import 'package:pokedex/modules/pokedex/domain/entities/pokemon.dart';

abstract class IsarDatasource {
  Future<List<Pokemon>> fetchPokemonList(int offset, int limit);
  Future<void> savePokemons(List<Pokemon> pokemons);
  Future<Pokemon?> getPokemon(String id);
  Future<void> updatePokemonImage(String id, List<int> image);
}
