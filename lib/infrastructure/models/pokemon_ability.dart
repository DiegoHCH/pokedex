
class PokemonAbilityResponse {
    final List<dynamic> effectChanges;
    final List<EffectEntry> effectEntries;
    final List<FlavorTextEntry> flavorTextEntries;
    final Generation generation;
    final int id;
    final bool isMainSeries;
    final String name;
    final List<AbilityName> names;
    final List<PokemonX> pokemon;

    PokemonAbilityResponse({
        required this.effectChanges,
        required this.effectEntries,
        required this.flavorTextEntries,
        required this.generation,
        required this.id,
        required this.isMainSeries,
        required this.name,
        required this.names,
        required this.pokemon,
    });

    factory PokemonAbilityResponse.fromJson(Map<String, dynamic> json) => PokemonAbilityResponse(
        effectChanges: List<dynamic>.from(json["effect_changes"].map((x) => x)),
        effectEntries: List<EffectEntry>.from(json["effect_entries"].map((x) => EffectEntry.fromJson(x))),
        flavorTextEntries: List<FlavorTextEntry>.from(json["flavor_text_entries"].map((x) => FlavorTextEntry.fromJson(x))),
        generation: Generation.fromJson(json["generation"]),
        id: json["id"],
        isMainSeries: json["is_main_series"],
        name: json["name"],
        names: List<AbilityName>.from(json["names"].map((x) => AbilityName.fromJson(x))),
        pokemon: List<PokemonX>.from(json["pokemon"].map((x) => PokemonX.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "effect_changes": List<dynamic>.from(effectChanges.map((x) => x)),
        "effect_entries": List<dynamic>.from(effectEntries.map((x) => x.toJson())),
        "flavor_text_entries": List<dynamic>.from(flavorTextEntries.map((x) => x.toJson())),
        "generation": generation.toJson(),
        "id": id,
        "is_main_series": isMainSeries,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
    };
}

class EffectEntry {
    final String effect;
    final Generation language;
    final String shortEffect;

    EffectEntry({
        required this.effect,
        required this.language,
        required this.shortEffect,
    });

    factory EffectEntry.fromJson(Map<String, dynamic> json) => EffectEntry(
        effect: json["effect"],
        language: Generation.fromJson(json["language"]),
        shortEffect: json["short_effect"],
    );

    Map<String, dynamic> toJson() => {
        "effect": effect,
        "language": language.toJson(),
        "short_effect": shortEffect,
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

class FlavorTextEntry {
    final String flavorText;
    final Generation language;
    final Generation versionGroup;

    FlavorTextEntry({
        required this.flavorText,
        required this.language,
        required this.versionGroup,
    });

    factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: Generation.fromJson(json["language"]),
        versionGroup: Generation.fromJson(json["version_group"]),
    );

    Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language.toJson(),
        "version_group": versionGroup.toJson(),
    };
}

class AbilityName {
    final Generation language;
    final String name;

    AbilityName({
        required this.language,
        required this.name,
    });

    factory AbilityName.fromJson(Map<String, dynamic> json) => AbilityName(
        language: Generation.fromJson(json["language"]),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "language": language.toJson(),
        "name": name,
    };
}

class PokemonX {
    final bool isHidden;
    final Generation pokemon;
    final int slot;

    PokemonX({
        required this.isHidden,
        required this.pokemon,
        required this.slot,
    });

    factory PokemonX.fromJson(Map<String, dynamic> json) => PokemonX(
        isHidden: json["is_hidden"],
        pokemon: Generation.fromJson(json["pokemon"]),
        slot: json["slot"],
    );

    Map<String, dynamic> toJson() => {
        "is_hidden": isHidden,
        "pokemon": pokemon.toJson(),
        "slot": slot,
    };
}
