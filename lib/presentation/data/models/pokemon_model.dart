import 'dart:convert';

class Pokemon {
    final List<AbilityElement> abilities;

    Pokemon({
        required this.abilities,
    });

    factory Pokemon.fromRawJson(String str) => Pokemon.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        abilities: List<AbilityElement>.from(json["abilities"].map((x) => AbilityElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
    };
}

class AbilityElement {
    final AbilityAbility ability;
    final bool isHidden;
    final int slot;

    AbilityElement({
        required this.ability,
        required this.isHidden,
        required this.slot,
    });

    factory AbilityElement.fromRawJson(String str) => AbilityElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AbilityElement.fromJson(Map<String, dynamic> json) => AbilityElement(
        ability: AbilityAbility.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
    );

    Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
    };
}

class AbilityAbility {
    final String name;
    final String url;

    AbilityAbility({
        required this.name,
        required this.url,
    });

    factory AbilityAbility.fromRawJson(String str) => AbilityAbility.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AbilityAbility.fromJson(Map<String, dynamic> json) => AbilityAbility(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
