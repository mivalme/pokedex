import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'pokemon.g.dart';

@Collection(inheritance: false)
class Pokemon extends Equatable {
  @Index(unique: true, replace: true)
  final String id;

  final Id isarId;
  final List<Ability> abilities;
  final List<PokemonType> types;
  final String name;
  final List<int> image;
  final int height;
  final int weight;
  final List<Stats> stats;

  const Pokemon({
    this.isarId = Isar.autoIncrement,
    required this.abilities,
    required this.id,
    required this.types,
    required this.name,
    required this.image,
    required this.height,
    required this.weight,
    required this.stats,
  });

  Pokemon copyWith({
    List<Ability>? abilities,
    List<PokemonType>? types,
    String? name,
    List<int>? image,
    int? height,
    int? weight,
    List<Stats>? stats,
  }) =>
      Pokemon(
        isarId: isarId,
        abilities: abilities ?? this.abilities,
        id: id,
        types: types ?? this.types,
        name: name ?? this.name,
        image: image ?? this.image,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        stats: stats ?? this.stats,
      );

  @ignore
  @override
  List<Object> get props =>
      [isarId, abilities, id, types, name, image, height, weight, stats];
}

@embedded
class Ability {
  final Species? ability;
  final bool? isHidden;
  final int? slot;

  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );
}

@embedded
class Species {
  final String? name;
  final String? url;

  Species({
    this.name,
    this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );
}

@embedded
class PokemonType {
  final int? slot;
  final TypeInfo? type;

  PokemonType({
    this.slot,
    this.type,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) => PokemonType(
        slot: json["slot"],
        type: TypeInfo.fromJson(json["type"]),
      );
}

@embedded
class Stats {
  final int? baseStat;
  final Stat? stat;

  Stats({
    this.baseStat,
    this.stat,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        baseStat: json["base_stat"],
        stat: Stat.fromJson(json["stat"]),
      );
}

@embedded
class Stat {
  final String? name;

  Stat({
    this.name,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        name: json["name"],
      );
}

enum PokemonTypeEnum {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  unknown,
  shadow,
}

@Embedded(inheritance: false)
class TypeInfo {
  @enumerated
  final PokemonTypeEnum name;
  final String? url;

  TypeInfo({
    this.name = PokemonTypeEnum.unknown,
    this.url,
  });

  factory TypeInfo.fromJson(Map<String, dynamic> json) {
    PokemonTypeEnum name;
    try {
      name = PokemonTypeEnum.values.byName(json["name"]);
    } catch (_) {
      name = PokemonTypeEnum.unknown;
    }

    return TypeInfo(
      name: name,
      url: json["url"],
    );
  }

  @ignore
  Color get typeColor {
    switch (name) {
      case PokemonTypeEnum.grass:
        return const Color(0xff48CFB2);
      case PokemonTypeEnum.fire:
        return const Color(0xffFA6C6C);
      case PokemonTypeEnum.water:
        return const Color(0xff6890F0);
      case PokemonTypeEnum.bug:
        return const Color(0xffA8B820);
      case PokemonTypeEnum.normal:
        return const Color(0xffA8A878);
      case PokemonTypeEnum.poison:
        return const Color(0xffA040A0);
      case PokemonTypeEnum.electric:
        return const Color(0xffFFCE4B);
      case PokemonTypeEnum.ground:
        return const Color(0xffE0C068);
      case PokemonTypeEnum.fairy:
        return const Color(0xffEE99AC);
      case PokemonTypeEnum.fighting:
        return const Color(0xffC03028);
      case PokemonTypeEnum.psychic:
        return const Color(0xffF85888);
      case PokemonTypeEnum.rock:
        return const Color(0xffB8A038);
      case PokemonTypeEnum.ghost:
        return const Color(0xff705898);
      case PokemonTypeEnum.flying:
        return const Color(0xffA890F0);
      case PokemonTypeEnum.steel:
        return const Color(0xffB8B8D0);
      case PokemonTypeEnum.ice:
        return const Color(0xff98D8D8);
      case PokemonTypeEnum.dragon:
        return const Color(0xff7038F8);
      case PokemonTypeEnum.dark:
        return const Color(0xff705848);
      default:
        return Colors.yellow;
    }
  }
}
