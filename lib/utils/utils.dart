import 'package:intl/intl.dart';
import 'package:project_a/utils/data_adapter.dart';
import 'package:intl/intl.dart';

final _currencyFormatter = NumberFormat.currency(
  locale: "pt_BR",
  symbol: "R\$",
);

double valueOfPercentage(double value, double percentage) {
  return value * percentage;
}

double valueOfGridFlex(double value, double flex) {
  return value / flex;
}

String formatCurrency(dynamic value) {
  int parsed = DataAdapter.parseInt(value.toString(), 0);
  return _currencyFormatter.format(parsed);
}

String formatDate(DateTime date) {
  final _dateFormatter = DateFormat.yMMMMd("pt_BR");
  return _dateFormatter.format(date);
}
