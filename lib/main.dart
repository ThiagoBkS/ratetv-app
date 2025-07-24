import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:project_a/my_app.dart';

void main() async {
  await initializeDateFormatting("pt_BR", null);

  runApp(const MyApp());
}
