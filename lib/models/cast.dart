class TMDBCast {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  TMDBCast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory TMDBCast.fromJson(Map<String, dynamic> json) {
    return TMDBCast(
      adult: json["adult"] ?? false,
      gender: json["gender"] ?? 0,
      id: json["id"],
      knownForDepartment: json["known_for_department"] ?? "",
      name: json["name"],
      originalName: json["original_name"],
      popularity: (json["popularity"] as num).toDouble(),
      profilePath: json["profile_path"],
      castId: json["cast_id"] ?? 0,
      character: json["character"] ?? "",
      creditId: json["credit_id"] ?? "",
      order: json["order"] ?? 0,
    );
  }
}
