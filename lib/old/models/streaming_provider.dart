class StreamingProvider {
  final String logoPath;
  final int providerId;
  final String providerName;
  final int displayPriority;

  StreamingProvider({
    required this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });

  factory StreamingProvider.fromJson(Map<String, dynamic> json) {
    return StreamingProvider(
      logoPath: json['logo_path'] ?? '',
      providerId: json['provider_id'],
      providerName: json['provider_name'],
      displayPriority: json['display_priority'],
    );
  }
}
