import 'package:dio/dio.dart';
import 'package:pokedex/modules/pokedex/domain/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex/modules/pokedex/infrastructure/models/pokemon_model.dart';
import 'package:pokedex/modules/pokedex/infrastructure/models/pokemons_response.dart';

class PokemonRemoteDatasourceImpl extends PokemonRemoteDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: ''),
  );

  @override
  Future<List<PokemonModel>> fetchPokemonList(int offset, int limit) async {
    final response = await dio.get(
      'https://pokeapi.co/api/v2/pokemon',
      queryParameters: {
        'offset': offset,
        'limit': limit,
      },
    );

    final responseModel = PokemonsReponse.fromJson(response.data);

    List<PokemonModel> pokemons = [];

    for (final item in responseModel.results) {
      final response = await dio.get(item.url);
      final responseModel = PokemonModel.fromJson(response.data);

      final imageData = await dio.get(
        'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${responseModel.id}.png',
        options: Options(responseType: ResponseType.bytes),
      );

      final List<int> image = imageData.data;

      pokemons.add(responseModel.copyWith(image: image));
    }

    return pokemons;
  }
}
