// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPokemonCollection on Isar {
  IsarCollection<Pokemon> get pokemons => this.collection();
}

const PokemonSchema = CollectionSchema(
  name: r'Pokemon',
  id: -6363737917301323018,
  properties: {
    r'abilities': PropertySchema(
      id: 0,
      name: r'abilities',
      type: IsarType.objectList,
      target: r'Ability',
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.string,
    ),
    r'moves': PropertySchema(
      id: 2,
      name: r'moves',
      type: IsarType.objectList,
      target: r'Move',
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'types': PropertySchema(
      id: 4,
      name: r'types',
      type: IsarType.objectList,
      target: r'PokemonType',
    )
  },
  estimateSize: _pokemonEstimateSize,
  serialize: _pokemonSerialize,
  deserialize: _pokemonDeserialize,
  deserializeProp: _pokemonDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Ability': AbilitySchema,
    r'Species': SpeciesSchema,
    r'Move': MoveSchema,
    r'PokemonType': PokemonTypeSchema,
    r'TypeInfo': TypeInfoSchema
  },
  getId: _pokemonGetId,
  getLinks: _pokemonGetLinks,
  attach: _pokemonAttach,
  version: '3.1.0+1',
);

int _pokemonEstimateSize(
  Pokemon object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.abilities.length * 3;
  {
    final offsets = allOffsets[Ability]!;
    for (var i = 0; i < object.abilities.length; i++) {
      final value = object.abilities[i];
      bytesCount += AbilitySchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.moves.length * 3;
  {
    final offsets = allOffsets[Move]!;
    for (var i = 0; i < object.moves.length; i++) {
      final value = object.moves[i];
      bytesCount += MoveSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.types.length * 3;
  {
    final offsets = allOffsets[PokemonType]!;
    for (var i = 0; i < object.types.length; i++) {
      final value = object.types[i];
      bytesCount += PokemonTypeSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _pokemonSerialize(
  Pokemon object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Ability>(
    offsets[0],
    allOffsets,
    AbilitySchema.serialize,
    object.abilities,
  );
  writer.writeString(offsets[1], object.id);
  writer.writeObjectList<Move>(
    offsets[2],
    allOffsets,
    MoveSchema.serialize,
    object.moves,
  );
  writer.writeString(offsets[3], object.name);
  writer.writeObjectList<PokemonType>(
    offsets[4],
    allOffsets,
    PokemonTypeSchema.serialize,
    object.types,
  );
}

Pokemon _pokemonDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Pokemon(
    abilities: reader.readObjectList<Ability>(
          offsets[0],
          AbilitySchema.deserialize,
          allOffsets,
          Ability(),
        ) ??
        [],
    id: reader.readString(offsets[1]),
    isarId: id,
    moves: reader.readObjectList<Move>(
          offsets[2],
          MoveSchema.deserialize,
          allOffsets,
          Move(),
        ) ??
        [],
    name: reader.readString(offsets[3]),
    types: reader.readObjectList<PokemonType>(
          offsets[4],
          PokemonTypeSchema.deserialize,
          allOffsets,
          PokemonType(),
        ) ??
        [],
  );
  return object;
}

P _pokemonDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Ability>(
            offset,
            AbilitySchema.deserialize,
            allOffsets,
            Ability(),
          ) ??
          []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readObjectList<Move>(
            offset,
            MoveSchema.deserialize,
            allOffsets,
            Move(),
          ) ??
          []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readObjectList<PokemonType>(
            offset,
            PokemonTypeSchema.deserialize,
            allOffsets,
            PokemonType(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pokemonGetId(Pokemon object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _pokemonGetLinks(Pokemon object) {
  return [];
}

void _pokemonAttach(IsarCollection<dynamic> col, Id id, Pokemon object) {}

extension PokemonQueryWhereSort on QueryBuilder<Pokemon, Pokemon, QWhere> {
  QueryBuilder<Pokemon, Pokemon, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PokemonQueryWhere on QueryBuilder<Pokemon, Pokemon, QWhereClause> {
  QueryBuilder<Pokemon, Pokemon, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PokemonQueryFilter
    on QueryBuilder<Pokemon, Pokemon, QFilterCondition> {
  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> abilitiesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> abilitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> abilitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> abilitiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      abilitiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> abilitiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> movesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> movesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> movesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> movesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> movesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> movesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> typesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> typesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> typesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> typesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> typesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> typesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension PokemonQueryObject
    on QueryBuilder<Pokemon, Pokemon, QFilterCondition> {
  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> abilitiesElement(
      FilterQuery<Ability> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'abilities');
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> movesElement(
      FilterQuery<Move> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'moves');
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> typesElement(
      FilterQuery<PokemonType> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'types');
    });
  }
}

extension PokemonQueryLinks
    on QueryBuilder<Pokemon, Pokemon, QFilterCondition> {}

extension PokemonQuerySortBy on QueryBuilder<Pokemon, Pokemon, QSortBy> {
  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PokemonQuerySortThenBy
    on QueryBuilder<Pokemon, Pokemon, QSortThenBy> {
  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PokemonQueryWhereDistinct
    on QueryBuilder<Pokemon, Pokemon, QDistinct> {
  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension PokemonQueryProperty
    on QueryBuilder<Pokemon, Pokemon, QQueryProperty> {
  QueryBuilder<Pokemon, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Pokemon, List<Ability>, QQueryOperations> abilitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abilities');
    });
  }

  QueryBuilder<Pokemon, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Pokemon, List<Move>, QQueryOperations> movesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moves');
    });
  }

  QueryBuilder<Pokemon, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Pokemon, List<PokemonType>, QQueryOperations> typesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'types');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AbilitySchema = Schema(
  name: r'Ability',
  id: 5399669653591405753,
  properties: {
    r'ability': PropertySchema(
      id: 0,
      name: r'ability',
      type: IsarType.object,
      target: r'Species',
    ),
    r'isHidden': PropertySchema(
      id: 1,
      name: r'isHidden',
      type: IsarType.bool,
    ),
    r'slot': PropertySchema(
      id: 2,
      name: r'slot',
      type: IsarType.long,
    )
  },
  estimateSize: _abilityEstimateSize,
  serialize: _abilitySerialize,
  deserialize: _abilityDeserialize,
  deserializeProp: _abilityDeserializeProp,
);

int _abilityEstimateSize(
  Ability object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.ability;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _abilitySerialize(
  Ability object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Species>(
    offsets[0],
    allOffsets,
    SpeciesSchema.serialize,
    object.ability,
  );
  writer.writeBool(offsets[1], object.isHidden);
  writer.writeLong(offsets[2], object.slot);
}

Ability _abilityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Ability(
    ability: reader.readObjectOrNull<Species>(
      offsets[0],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    isHidden: reader.readBoolOrNull(offsets[1]),
    slot: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _abilityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AbilityQueryFilter
    on QueryBuilder<Ability, Ability, QFilterCondition> {
  QueryBuilder<Ability, Ability, QAfterFilterCondition> abilityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ability',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> abilityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ability',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> isHiddenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isHidden',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> isHiddenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isHidden',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> isHiddenEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isHidden',
        value: value,
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> slotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'slot',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> slotIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'slot',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> slotEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> slotGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> slotLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> slotBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'slot',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AbilityQueryObject
    on QueryBuilder<Ability, Ability, QFilterCondition> {
  QueryBuilder<Ability, Ability, QAfterFilterCondition> ability(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ability');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SpeciesSchema = Schema(
  name: r'Species',
  id: -1724512414814962385,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 1,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _speciesEstimateSize,
  serialize: _speciesSerialize,
  deserialize: _speciesDeserialize,
  deserializeProp: _speciesDeserializeProp,
);

int _speciesEstimateSize(
  Species object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _speciesSerialize(
  Species object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeString(offsets[1], object.url);
}

Species _speciesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Species(
    name: reader.readStringOrNull(offsets[0]),
    url: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _speciesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SpeciesQueryFilter
    on QueryBuilder<Species, Species, QFilterCondition> {
  QueryBuilder<Species, Species, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension SpeciesQueryObject
    on QueryBuilder<Species, Species, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MoveSchema = Schema(
  name: r'Move',
  id: 5504967249916866048,
  properties: {
    r'move': PropertySchema(
      id: 0,
      name: r'move',
      type: IsarType.object,
      target: r'Species',
    )
  },
  estimateSize: _moveEstimateSize,
  serialize: _moveSerialize,
  deserialize: _moveDeserialize,
  deserializeProp: _moveDeserializeProp,
);

int _moveEstimateSize(
  Move object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.move;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _moveSerialize(
  Move object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Species>(
    offsets[0],
    allOffsets,
    SpeciesSchema.serialize,
    object.move,
  );
}

Move _moveDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Move(
    move: reader.readObjectOrNull<Species>(
      offsets[0],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _moveDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MoveQueryFilter on QueryBuilder<Move, Move, QFilterCondition> {
  QueryBuilder<Move, Move, QAfterFilterCondition> moveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'move',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> moveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'move',
      ));
    });
  }
}

extension MoveQueryObject on QueryBuilder<Move, Move, QFilterCondition> {
  QueryBuilder<Move, Move, QAfterFilterCondition> move(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'move');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PokemonTypeSchema = Schema(
  name: r'PokemonType',
  id: 229780386400146563,
  properties: {
    r'slot': PropertySchema(
      id: 0,
      name: r'slot',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 1,
      name: r'type',
      type: IsarType.object,
      target: r'TypeInfo',
    )
  },
  estimateSize: _pokemonTypeEstimateSize,
  serialize: _pokemonTypeSerialize,
  deserialize: _pokemonTypeDeserialize,
  deserializeProp: _pokemonTypeDeserializeProp,
);

int _pokemonTypeEstimateSize(
  PokemonType object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 +
          TypeInfoSchema.estimateSize(value, allOffsets[TypeInfo]!, allOffsets);
    }
  }
  return bytesCount;
}

void _pokemonTypeSerialize(
  PokemonType object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.slot);
  writer.writeObject<TypeInfo>(
    offsets[1],
    allOffsets,
    TypeInfoSchema.serialize,
    object.type,
  );
}

PokemonType _pokemonTypeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PokemonType(
    slot: reader.readLongOrNull(offsets[0]),
    type: reader.readObjectOrNull<TypeInfo>(
      offsets[1],
      TypeInfoSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _pokemonTypeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<TypeInfo>(
        offset,
        TypeInfoSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PokemonTypeQueryFilter
    on QueryBuilder<PokemonType, PokemonType, QFilterCondition> {
  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition> slotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'slot',
      ));
    });
  }

  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition>
      slotIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'slot',
      ));
    });
  }

  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition> slotEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition> slotGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition> slotLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition> slotBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'slot',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition>
      typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }
}

extension PokemonTypeQueryObject
    on QueryBuilder<PokemonType, PokemonType, QFilterCondition> {
  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition> type(
      FilterQuery<TypeInfo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'type');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TypeInfoSchema = Schema(
  name: r'TypeInfo',
  id: 3601525039448991772,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.byte,
      enumMap: _TypeInfonameEnumValueMap,
    ),
    r'url': PropertySchema(
      id: 1,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _typeInfoEstimateSize,
  serialize: _typeInfoSerialize,
  deserialize: _typeInfoDeserialize,
  deserializeProp: _typeInfoDeserializeProp,
);

int _typeInfoEstimateSize(
  TypeInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _typeInfoSerialize(
  TypeInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.name.index);
  writer.writeString(offsets[1], object.url);
}

TypeInfo _typeInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TypeInfo(
    name: _TypeInfonameValueEnumMap[reader.readByteOrNull(offsets[0])] ??
        PokemonTypeEnum.unknown,
    url: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _typeInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_TypeInfonameValueEnumMap[reader.readByteOrNull(offset)] ??
          PokemonTypeEnum.unknown) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TypeInfonameEnumValueMap = {
  'normal': 0,
  'fighting': 1,
  'flying': 2,
  'poison': 3,
  'ground': 4,
  'rock': 5,
  'bug': 6,
  'ghost': 7,
  'steel': 8,
  'fire': 9,
  'water': 10,
  'grass': 11,
  'electric': 12,
  'psychic': 13,
  'ice': 14,
  'dragon': 15,
  'dark': 16,
  'fairy': 17,
  'unknown': 18,
  'shadow': 19,
};
const _TypeInfonameValueEnumMap = {
  0: PokemonTypeEnum.normal,
  1: PokemonTypeEnum.fighting,
  2: PokemonTypeEnum.flying,
  3: PokemonTypeEnum.poison,
  4: PokemonTypeEnum.ground,
  5: PokemonTypeEnum.rock,
  6: PokemonTypeEnum.bug,
  7: PokemonTypeEnum.ghost,
  8: PokemonTypeEnum.steel,
  9: PokemonTypeEnum.fire,
  10: PokemonTypeEnum.water,
  11: PokemonTypeEnum.grass,
  12: PokemonTypeEnum.electric,
  13: PokemonTypeEnum.psychic,
  14: PokemonTypeEnum.ice,
  15: PokemonTypeEnum.dragon,
  16: PokemonTypeEnum.dark,
  17: PokemonTypeEnum.fairy,
  18: PokemonTypeEnum.unknown,
  19: PokemonTypeEnum.shadow,
};

extension TypeInfoQueryFilter
    on QueryBuilder<TypeInfo, TypeInfo, QFilterCondition> {
  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> nameEqualTo(
      PokemonTypeEnum value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> nameGreaterThan(
    PokemonTypeEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> nameLessThan(
    PokemonTypeEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> nameBetween(
    PokemonTypeEnum lower,
    PokemonTypeEnum upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<TypeInfo, TypeInfo, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension TypeInfoQueryObject
    on QueryBuilder<TypeInfo, TypeInfo, QFilterCondition> {}
