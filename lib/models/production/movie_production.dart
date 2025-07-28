import 'package:project_a/models/production/origin_country.dart';
import 'package:project_a/models/production/production_company.dart';
import 'package:project_a/models/production/production_country.dart';
import 'package:project_a/utils/data_adapter.dart';

class MovieProduction {
  final String originalTitle;
  final List<OriginCountry> originCountry;
  final int budget;
  final int revenue;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountry;

  const MovieProduction({
    required this.originalTitle,
    required this.originCountry,
    required this.budget,
    required this.revenue,
    required this.productionCompanies,
    required this.productionCountry,
  });

  static List<ProductionCompany> parseProductionCompanies(dynamic json) {
    return [];
  }

  factory MovieProduction.fromJson(Map<String, dynamic> json) {
    return MovieProduction(
      originalTitle: DataAdapter.parseString(
        json["original_title"],
        "Desconhecido",
      ),
      originCountry: [OriginCountry(name: "US")],
      budget: DataAdapter.parseInt(json["budget"], 0),
      revenue: DataAdapter.parseInt(json["revenue"], 0),
      productionCompanies: [
        ProductionCompany(name: "Fox 2000 Pictures"),
        ProductionCompany(name: "Regency Enterprises"),
        ProductionCompany(name: "Linson Entertainment"),
        ProductionCompany(name: "20th Century Fox"),
        ProductionCompany(name: "Taurus Film"),
      ],
      productionCountry: [
        ProductionCountry(name: "Germany"),
        ProductionCountry(name: "United States of America"),
      ],
    );
  }
}
