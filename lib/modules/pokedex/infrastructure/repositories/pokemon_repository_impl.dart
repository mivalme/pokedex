import 'package:pokedex/modules/pokedex/domain/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex/modules/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/modules/pokedex/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonRemoteDatasource remoteDatasource;

  PokemonRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<Pokemon>> fetchPokemonList(int offset, int limit) {
    return remoteDatasource.fetchPokemonList(offset, limit);
  }
}
