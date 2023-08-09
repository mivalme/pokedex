import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokedex/modules/pokedex/domain/datasources/isar_datasource.dart';
import 'package:pokedex/modules/pokedex/domain/entities/pokemon.dart';

class IsarDatasourceImpl extends IsarDatasource {
  
  late Future<Isar> db;

  IsarDatasourceImpl() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [PokemonSchema],
        directory: dir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<List<Pokemon>> fetchPokemonList(int offset, int limit) {
    // TODO: implement fetchPokemonList
    throw UnimplementedError();
  }

  @override
  Future<void> savePokemons(List<Pokemon> pokemons) {
    // TODO: implement savePokemons
    throw UnimplementedError();
  }

}