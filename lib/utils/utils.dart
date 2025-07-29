import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_a/pages/movie_page.dart';
import 'package:project_a/utils/data_adapter.dart';

final _currencyFormatter = NumberFormat.currency(
  locale: "pt_BR",
  symbol: "R\$",
);

final _dateFormatter = DateFormat.yMMMMd("pt_BR");

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
  return _dateFormatter.format(date);
}

void goToMoviePage(BuildContext context, int movieId) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MoviePage(
        movieId: movieId,
        onBackToMain: () => {Navigator.pop(context)},
      ),
    ),
  );
}
