import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pokedex/modules/pokedex/domain/datasources/isar_datasource.dart';
import 'package:pokedex/modules/pokedex/domain/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex/modules/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/modules/pokedex/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonRemoteDatasource remoteDatasource;
  final IsarDatasource isarDatasource;

  PokemonRepositoryImpl(this.remoteDatasource, this.isarDatasource);

  @override
  Future<List<Pokemon>> fetchPokemonList(int offset, int limit) async {
    final bool isConnected = await InternetConnection().hasInternetAccess;
    final localPokemons = await isarDatasource.fetchPokemonList(offset, limit);

    if (isConnected && localPokemons.isEmpty) {
      final pokemons = await remoteDatasource.fetchPokemonList(offset, limit);
      await isarDatasource.savePokemons(pokemons);
      return pokemons;
    } else {
      return localPokemons;
    }
  }

  @override
  Future<Pokemon?> getPokemon(String id) {
    return isarDatasource.getPokemon(id);
  }
}
