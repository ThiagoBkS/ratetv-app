import 'package:project_a/utils/data_adapter.dart';

class StreamingService {
  final String logo;
  final int id;
  final String name;

  StreamingService({required this.logo, required this.id, required this.name});

  factory StreamingService.fromJson(Map<String, dynamic> json) {
    return StreamingService(
      logo: DataAdapter.parseString(json["logo_path"], ""),
      id: DataAdapter.parseInt(json["provider_id"], 0),
      name: DataAdapter.parseString(json["provider_name"], ""),
    );
  }
}
