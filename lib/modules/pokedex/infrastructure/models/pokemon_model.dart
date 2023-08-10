import 'package:pokedex/modules/pokedex/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    required super.abilities,
    required super.id,
    required super.types,
    required super.name,
    required super.image,
    required super.height,
    required super.weight,
    required super.stats
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        id: addZeros(json["id"].toString()),
        name: json["name"],
        types: List<PokemonType>.from(json["types"].map((x) => PokemonType.fromJson(x))),
        image: const [],
        weight: json["weight"],
        height: json["height"],
        stats: List<Stats>.from(json["stats"].map((x) => Stats.fromJson(x))),
      );

  static String addZeros(String number) {
    number = number;
    while (number.length < 3) {
      number = '0$number';
    }
    return number;
  }
}