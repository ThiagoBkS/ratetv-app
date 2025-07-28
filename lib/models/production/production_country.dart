import 'package:project_a/utils/data_adapter.dart';

class ProductionCountry {
  final String name;
  const ProductionCountry({required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      name: DataAdapter.parseString(json["name"], "Desconhecido"),
    );
  }
}
