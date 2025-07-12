import 'package:project_a/models/profile_stat.dart';

class UserProfile {
  final String name;
  final String username;
  final String avatarUrl;
  final String backdropUrl;
  final int likedCount;
  final int watchedCount;
  final int watchLaterCount;

  UserProfile({
    required this.name,
    required this.username,
    required this.avatarUrl,
    required this.backdropUrl,
    required this.likedCount,
    required this.watchedCount,
    required this.watchLaterCount,
  });

  List<ProfileStat> get stats => [
    ProfileStat(label: "Liked", value: likedCount),
    ProfileStat(label: "Watched", value: watchLaterCount),
    ProfileStat(label: "Watch Later", value: watchLaterCount),
  ];
}
