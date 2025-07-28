import 'package:project_a/utils/data_adapter.dart';

class ProductionCompany {
  final String name;
  const ProductionCompany({required this.name});

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      name: DataAdapter.parseString(json["name"], "Desconhecido"),
    );
  }
}
