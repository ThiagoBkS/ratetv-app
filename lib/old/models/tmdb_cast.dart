class TMDBCast {
  final int id;
  final String originalName;
  final String profilePath;
  final String character;

  const TMDBCast({
    required this.id,
    required this.originalName,
    required this.profilePath,
    required this.character,
  });

  factory TMDBCast.fromJson(Map<String, dynamic> json) {
    return TMDBCast(
      id: json["id"],
      originalName: json["original_name"] ?? "Unknow Name",
      profilePath: json["profile_path"],
      character: json["character"] ?? "Unknow Character",
    );
  }
}
