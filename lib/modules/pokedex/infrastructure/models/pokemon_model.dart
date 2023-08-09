import 'package:pokedex/modules/pokedex/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required super.abilities,
    required super.id,
    required super.moves,
    required super.types,
    required super.name,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        id: addZeros(json["id"].toString()),
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"],
        types: List<PokemonType>.from(json["types"].map((x) => PokemonType.fromJson(x))),
      );

  static String addZeros(String number) {
    number = number;
    while (number.length < 3) {
      number = '0$number';
    }
    return number;
  }
}
