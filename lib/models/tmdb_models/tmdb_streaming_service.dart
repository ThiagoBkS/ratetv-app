import 'package:project_a/models/streaming_service.dart';
import 'package:project_a/utils/data_adapter.dart';

class TmdbStreamingService implements StreamingService {
  @override
  final String logo;

  @override
  final int id;

  @override
  final String name;

  TmdbStreamingService({
    required this.logo,
    required this.id,
    required this.name,
  });

  factory TmdbStreamingService.fromJson(Map<String, dynamic> json) {
    return TmdbStreamingService(
      logo: DataAdapter.parseString(json["logo_path"], ""),
      id: DataAdapter.parseInt(json["provider_id"], 0),
      name: DataAdapter.parseString(json["provider_name"], ""),
    );
  }
}
