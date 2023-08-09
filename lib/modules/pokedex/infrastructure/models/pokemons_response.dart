class PokemonsReponse {
    final int count;
    final String next;
    final List<Result> results;

    PokemonsReponse({
        required this.count,
        required this.next,
        required this.results,
    });

    factory PokemonsReponse.fromJson(Map<String, dynamic> json) => PokemonsReponse(
        count: json["count"],
        next: json["next"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );
}

class Result {
    final String name;
    final String url;

    Result({
        required this.name,
        required this.url,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
    );
}
