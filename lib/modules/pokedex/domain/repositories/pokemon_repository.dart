import 'package:pokedex/modules/pokedex/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> fetchPokemonList(int offset, int limit);
}
