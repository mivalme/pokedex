import 'package:pokedex/modules/pokedex/domain/entities/pokemon.dart';

abstract class PokemonRemoteDatasource {
  Future<List<Pokemon>> fetchPokemonList(int offset, int limit);
}
