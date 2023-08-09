import 'package:flutter/material.dart';

class Pokemon {
  final List<Ability> abilities;
  final String id;
  final List<Move> moves;
  final List<Type> types;
  final String name;

  Pokemon({
    required this.abilities,
    required this.id,
    required this.moves,
    required this.types,
    required this.name,
  });
}

class Ability {
  final Species ability;
  final bool isHidden;
  final int slot;

  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );
}

class Species {
  final String name;
  final String url;

  Species({
    required this.name,
    required this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );
}

class Move {
  final Species move;

  Move({
    required this.move,
  });

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json["move"]),
      );
}

class Type {
  final int slot;
  final TypeInfo type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: TypeInfo.fromJson(json["type"]),
      );
}

enum PokemonType {
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

class TypeInfo {
  final PokemonType name;
  final String url;

  TypeInfo({
    required this.name,
    required this.url,
  });

  factory TypeInfo.fromJson(Map<String, dynamic> json) {
    PokemonType name;
    try {
      name = PokemonType.values.byName(json["name"]);
    } catch (_) {
      name = PokemonType.unknown;
    }

    return TypeInfo(
      name: name,
      url: json["url"],
    );
  }

  Color get typeColor {
    switch (name) {
      case PokemonType.grass:
        return const Color(0xff00A78D);
      case PokemonType.fire:
        return const Color(0xffDB7775);
      case PokemonType.water:
        return const Color(0xff00A3D2);
      case PokemonType.bug:
        return const Color(0xff8C9E5F);
      case PokemonType.normal:
        return const Color(0xff8F8F8F);
      case PokemonType.poison:
        return const Color(0xff715F9E);
      case PokemonType.electric:
        return const Color(0xffFFC135);
      case PokemonType.ground:
        return const Color(0xff865B00);
      case PokemonType.fairy:
        return const Color(0xffCE4A90);
      case PokemonType.fighting:
        return const Color(0xff5C0030);
      case PokemonType.psychic:
        return const Color(0xff3F2C4E);
      case PokemonType.rock:
        return const Color(0xffA0522D);
      case PokemonType.ghost:
        return const Color(0xffF981BF);
      default:
        return Colors.yellow;
    }
  }
}
