
class PokemonTypeResponse {
    final DamageRelations damageRelations;
    final List<GameIndex> gameIndices;
    final Generation generation;
    final int id;
    final Generation moveDamageClass;
    final List<Generation> moves;
    final String name;
    final List<TypeName> names;
    final List<dynamic> pastDamageRelations;
    final List<Pokemon> pokemon;
    final TypeSprites sprites;

    PokemonTypeResponse({
        required this.damageRelations,
        required this.gameIndices,
        required this.generation,
        required this.id,
        required this.moveDamageClass,
        required this.moves,
        required this.name,
        required this.names,
        required this.pastDamageRelations,
        required this.pokemon,
        required this.sprites,
    });

    factory PokemonTypeResponse.fromJson(Map<String, dynamic> json) => PokemonTypeResponse(
        damageRelations: DamageRelations.fromJson(json["damage_relations"]),
        gameIndices: List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromJson(x))),
        generation: Generation.fromJson(json["generation"]),
        id: json["id"],
        moveDamageClass: Generation.fromJson(json["move_damage_class"]),
        moves: List<Generation>.from(json["moves"].map((x) => Generation.fromJson(x))),
        name: json["name"],
        names: List<TypeName>.from(json["names"].map((x) => TypeName.fromJson(x))),
        pastDamageRelations: List<dynamic>.from(json["past_damage_relations"].map((x) => x)),
        pokemon: List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
        sprites: TypeSprites.fromJson(json["sprites"]),
    );

    Map<String, dynamic> toJson() => {
        "damage_relations": damageRelations.toJson(),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        "generation": generation.toJson(),
        "id": id,
        "move_damage_class": moveDamageClass.toJson(),
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "past_damage_relations": List<dynamic>.from(pastDamageRelations.map((x) => x)),
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
        "sprites": sprites.toJson(),
    };
}

class DamageRelations {
    final List<Generation> doubleDamageFrom;
    final List<Generation> doubleDamageTo;
    final List<Generation> halfDamageFrom;
    final List<Generation> halfDamageTo;
    final List<dynamic> noDamageFrom;
    final List<dynamic> noDamageTo;

    DamageRelations({
        required this.doubleDamageFrom,
        required this.doubleDamageTo,
        required this.halfDamageFrom,
        required this.halfDamageTo,
        required this.noDamageFrom,
        required this.noDamageTo,
    });

    factory DamageRelations.fromJson(Map<String, dynamic> json) => DamageRelations(
        doubleDamageFrom: List<Generation>.from(json["double_damage_from"].map((x) => Generation.fromJson(x))),
        doubleDamageTo: List<Generation>.from(json["double_damage_to"].map((x) => Generation.fromJson(x))),
        halfDamageFrom: List<Generation>.from(json["half_damage_from"].map((x) => Generation.fromJson(x))),
        halfDamageTo: List<Generation>.from(json["half_damage_to"].map((x) => Generation.fromJson(x))),
        noDamageFrom: List<dynamic>.from(json["no_damage_from"].map((x) => x)),
        noDamageTo: List<dynamic>.from(json["no_damage_to"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "double_damage_from": List<dynamic>.from(doubleDamageFrom.map((x) => x.toJson())),
        "double_damage_to": List<dynamic>.from(doubleDamageTo.map((x) => x.toJson())),
        "half_damage_from": List<dynamic>.from(halfDamageFrom.map((x) => x.toJson())),
        "half_damage_to": List<dynamic>.from(halfDamageTo.map((x) => x.toJson())),
        "no_damage_from": List<dynamic>.from(noDamageFrom.map((x) => x)),
        "no_damage_to": List<dynamic>.from(noDamageTo.map((x) => x)),
    };
}

class Generation {
    final String name;
    final String url;

    Generation({
        required this.name,
        required this.url,
    });

    factory Generation.fromJson(Map<String, dynamic> json) => Generation(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class GameIndex {
    final int gameIndex;
    final Generation generation;

    GameIndex({
        required this.gameIndex,
        required this.generation,
    });

    factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        generation: Generation.fromJson(json["generation"]),
    );

    Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "generation": generation.toJson(),
    };
}

class TypeName {
    final Generation language;
    final String name;

    TypeName({
        required this.language,
        required this.name,
    });

    factory TypeName.fromJson(Map<String, dynamic> json) => TypeName(
        language: Generation.fromJson(json["language"]),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "language": language.toJson(),
        "name": name,
    };
}

class Pokemon {
    final Generation pokemon;
    final int slot;

    Pokemon({
        required this.pokemon,
        required this.slot,
    });

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        pokemon: Generation.fromJson(json["pokemon"]),
        slot: json["slot"],
    );

    Map<String, dynamic> toJson() => {
        "pokemon": pokemon.toJson(),
        "slot": slot,
    };
} 

class TypeSprites {
    final TypeGenerationIii generationIii;
    final TypeGenerationIv generationIv;
    final TypeGenerationIx generationIx;
    final TypeGenerationV generationV;
    final Map<String, Colosseum> generationVi;
    final TypeGenerationVii generationVii;
    final TypeGenerationViii generationViii;

    TypeSprites({
        required this.generationIii,
        required this.generationIv,
        required this.generationIx,
        required this.generationV,
        required this.generationVi,
        required this.generationVii,
        required this.generationViii,
    });

    factory TypeSprites.fromJson(Map<String, dynamic> json) => TypeSprites(
        generationIii: TypeGenerationIii.fromJson(json["generation-iii"]),
        generationIv: TypeGenerationIv.fromJson(json["generation-iv"]),
        generationIx: TypeGenerationIx.fromJson(json["generation-ix"]),
        generationV: TypeGenerationV.fromJson(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"]).map((k, v) => MapEntry<String, Colosseum>(k, Colosseum.fromJson(v))),
        generationVii: TypeGenerationVii.fromJson(json["generation-vii"]),
        generationViii: TypeGenerationViii.fromJson(json["generation-viii"]),
    );

    Map<String, dynamic> toJson() => {
        "generation-iii": generationIii.toJson(),
        "generation-iv": generationIv.toJson(),
        "generation-ix": generationIx.toJson(),
        "generation-v": generationV.toJson(),
        "generation-vi": Map.from(generationVi).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "generation-vii": generationVii.toJson(),
        "generation-viii": generationViii.toJson(),
    };
}

class TypeGenerationIii {
    final Colosseum colosseum;
    final Colosseum emerald;
    final Colosseum fireredLeafgreen;
    final Colosseum rubySaphire;
    final Colosseum xd;

    TypeGenerationIii({
        required this.colosseum,
        required this.emerald,
        required this.fireredLeafgreen,
        required this.rubySaphire,
        required this.xd,
    });

    factory TypeGenerationIii.fromJson(Map<String, dynamic> json) => TypeGenerationIii(
        colosseum: Colosseum.fromJson(json["colosseum"]),
        emerald: Colosseum.fromJson(json["emerald"]),
        fireredLeafgreen: Colosseum.fromJson(json["firered-leafgreen"]),
        rubySaphire: Colosseum.fromJson(json["ruby-saphire"]),
        xd: Colosseum.fromJson(json["xd"]),
    );

    Map<String, dynamic> toJson() => {
        "colosseum": colosseum.toJson(),
        "emerald": emerald.toJson(),
        "firered-leafgreen": fireredLeafgreen.toJson(),
        "ruby-saphire": rubySaphire.toJson(),
        "xd": xd.toJson(),
    };
}

class Colosseum {
    final String nameIcon;

    Colosseum({
        required this.nameIcon,
    });

    factory Colosseum.fromJson(Map<String, dynamic> json) => Colosseum(
        nameIcon: json["name_icon"],
    );

    Map<String, dynamic> toJson() => {
        "name_icon": nameIcon,
    };
}

class TypeGenerationIv {
    final Colosseum diamondPearl;
    final Colosseum heartgoldSoulsilver;
    final Colosseum platinum;

    TypeGenerationIv({
        required this.diamondPearl,
        required this.heartgoldSoulsilver,
        required this.platinum,
    });

    factory TypeGenerationIv.fromJson(Map<String, dynamic> json) => TypeGenerationIv(
        diamondPearl: Colosseum.fromJson(json["diamond-pearl"]),
        heartgoldSoulsilver: Colosseum.fromJson(json["heartgold-soulsilver"]),
        platinum: Colosseum.fromJson(json["platinum"]),
    );

    Map<String, dynamic> toJson() => {
        "diamond-pearl": diamondPearl.toJson(),
        "heartgold-soulsilver": heartgoldSoulsilver.toJson(),
        "platinum": platinum.toJson(),
    };
}

class TypeGenerationIx {
    final Colosseum scarletViolet;

    TypeGenerationIx({
        required this.scarletViolet,
    });

    factory TypeGenerationIx.fromJson(Map<String, dynamic> json) => TypeGenerationIx(
        scarletViolet: Colosseum.fromJson(json["scarlet-violet"]),
    );

    Map<String, dynamic> toJson() => {
        "scarlet-violet": scarletViolet.toJson(),
    };
}

class TypeGenerationV {
    final Colosseum black2White2;
    final Colosseum blackWhite;

    TypeGenerationV({
        required this.black2White2,
        required this.blackWhite,
    });

    factory TypeGenerationV.fromJson(Map<String, dynamic> json) => TypeGenerationV(
        black2White2: Colosseum.fromJson(json["black-2-white-2"]),
        blackWhite: Colosseum.fromJson(json["black-white"]),
    );

    Map<String, dynamic> toJson() => {
        "black-2-white-2": black2White2.toJson(),
        "black-white": blackWhite.toJson(),
    };
}

class TypeGenerationVii {
    final Colosseum letsGoPikachuLetsGoEevee;
    final Colosseum sunMoon;
    final Colosseum ultraSunUltraMoon;

    TypeGenerationVii({
        required this.letsGoPikachuLetsGoEevee,
        required this.sunMoon,
        required this.ultraSunUltraMoon,
    });

    factory TypeGenerationVii.fromJson(Map<String, dynamic> json) => TypeGenerationVii(
        letsGoPikachuLetsGoEevee: Colosseum.fromJson(json["lets-go-pikachu-lets-go-eevee"]),
        sunMoon: Colosseum.fromJson(json["sun-moon"]),
        ultraSunUltraMoon: Colosseum.fromJson(json["ultra-sun-ultra-moon"]),
    );

    Map<String, dynamic> toJson() => {
        "lets-go-pikachu-lets-go-eevee": letsGoPikachuLetsGoEevee.toJson(),
        "sun-moon": sunMoon.toJson(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon.toJson(),
    };
}

class TypeGenerationViii {
    final Colosseum brilliantDiamondAndShiningPearl;
    final Colosseum legendsArceus;
    final Colosseum swordShield;

    TypeGenerationViii({
        required this.brilliantDiamondAndShiningPearl,
        required this.legendsArceus,
        required this.swordShield,
    });

    factory TypeGenerationViii.fromJson(Map<String, dynamic> json) => TypeGenerationViii(
        brilliantDiamondAndShiningPearl: Colosseum.fromJson(json["brilliant-diamond-and-shining-pearl"]),
        legendsArceus: Colosseum.fromJson(json["legends-arceus"]),
        swordShield: Colosseum.fromJson(json["sword-shield"]),
    );

    Map<String, dynamic> toJson() => {
        "brilliant-diamond-and-shining-pearl": brilliantDiamondAndShiningPearl.toJson(),
        "legends-arceus": legendsArceus.toJson(),
        "sword-shield": swordShield.toJson(),
    };
}
