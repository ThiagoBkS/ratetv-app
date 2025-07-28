import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/production/movie_production.dart';
import 'package:project_a/utils/utils.dart';
import 'package:project_a/widgets/movie_page_widgets/production_details/production_details_item.dart';

class MovieProductionDetails extends StatelessWidget {
  final MovieProduction production;
  const MovieProductionDetails({super.key, required this.production});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(56, 63, 68, 0.25),
        border: Border.all(color: Color.fromRGBO(56, 63, 68, 1)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 8,
        children: [
          Text(
            "Detalhes técnicos",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          ProductionDetailsItem(
            label: "Título original",
            value: production.originalTitle,
          ),
          ProductionDetailsItem(
            label: "País de origem",
            value: production.originCountry
                .map((production) => production.name)
                .join(', '),
          ),
          ProductionDetailsItem(
            label: "Orçamento",
            value: formatCurrency(production.budget),
          ),
          ProductionDetailsItem(
            label: "Receita",
            value: formatCurrency(production.revenue),
          ),
          ProductionDetailsItem(
            label: "País de produção",
            value: production.productionCountry
                .map((production) => production.name)
                .join(', '),
          ),
          ProductionDetailsItem(
            label: "Produtoras",
            value: production.productionCompanies
                .map((production) => production.name)
                .join(', '),
          ),
        ],
      ),
    );
  }
}
