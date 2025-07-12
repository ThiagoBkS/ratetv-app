class UserList {
  final String title;
  final String description;
  final double ratingAverage;
  final double totalItems;
  final List<String> posters;

  const UserList({
    required this.title,
    required this.description,
    required this.ratingAverage,
    required this.totalItems,
    required this.posters,
  });
}
