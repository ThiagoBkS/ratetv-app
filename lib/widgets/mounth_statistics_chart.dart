import 'package:flutter/material.dart';
import 'package:project_a/models/mounth_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MounthStatisticsChart extends StatelessWidget {
  final List<MounthData> statistics;
  MounthStatisticsChart({super.key, required this.statistics});

  final TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(isVisible: true),
      primaryYAxis: NumericAxis(isVisible: false),
      tooltipBehavior: tooltipBehavior,
      series: <CartesianSeries<MounthData, String>>[
        ColumnSeries<MounthData, String>(
          dataSource: statistics,
          xValueMapper: (MounthData mounth, _) => mounth.name,
          yValueMapper: (MounthData mounth, _) => mounth.ammount,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
      ],
    );
  }
}
