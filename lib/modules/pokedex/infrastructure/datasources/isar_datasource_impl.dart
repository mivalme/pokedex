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
  Future<List<Pokemon>> fetchPokemonList(int offset, int limit) async {
    final isar = await db;
    return isar.pokemons.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> savePokemons(List<Pokemon> pokemons) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.pokemons.putAllSync(pokemons));
  }

  @override
  Future<Pokemon?> getPokemon(String id) async {
    final isar = await db;
    return isar.pokemons.where().idEqualTo(id).findFirst();
  }

  @override
  Future<void> updatePokemonImage(String id, List<int> image) async {
    final isar = await db;
    final pokemon = await isar.pokemons.where().idEqualTo(id).findFirst();
    if (pokemon == null) return;
    return await isar.writeTxnSync(
        () => isar.pokemons.putSync(pokemon.copyWith(image: image)));
  }
}
