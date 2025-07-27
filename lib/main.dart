import 'package:flutter/material.dart';
import 'package:project_a/my_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await initializeDateFormatting('pt_BR', null);

  runApp(const MyApp());
}
