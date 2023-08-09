import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'pokemon.g.dart';

@Collection(inheritance: false)
class Pokemon extends Equatable {
  final Id isarId;
  final List<Ability> abilities;
  final String id;
  final List<Move> moves;
  final List<PokemonType> types;
  final String name;

  const Pokemon({
    this.isarId = Isar.autoIncrement,
    required this.abilities,
    required this.id,
    required this.moves,
    required this.types,
    required this.name,
  });

  @ignore @override 
  List<Object> get props => [isarId, abilities, id, moves, types, name];
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
class Move {
  final Species? move;

  Move({
    this.move,
  });

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json["move"]),
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
        return const Color(0xff00A78D);
      case PokemonTypeEnum.fire:
        return const Color(0xffDB7775);
      case PokemonTypeEnum.water:
        return const Color(0xff00A3D2);
      case PokemonTypeEnum.bug:
        return const Color(0xff8C9E5F);
      case PokemonTypeEnum.normal:
        return const Color(0xff8F8F8F);
      case PokemonTypeEnum.poison:
        return const Color(0xff715F9E);
      case PokemonTypeEnum.electric:
        return const Color(0xffFFC135);
      case PokemonTypeEnum.ground:
        return const Color(0xff865B00);
      case PokemonTypeEnum.fairy:
        return const Color(0xffCE4A90);
      case PokemonTypeEnum.fighting:
        return const Color(0xff5C0030);
      case PokemonTypeEnum.psychic:
        return const Color(0xff3F2C4E);
      case PokemonTypeEnum.rock:
        return const Color(0xffA0522D);
      case PokemonTypeEnum.ghost:
        return const Color(0xffF981BF);
      default:
        return Colors.yellow;
    }
  }
}
