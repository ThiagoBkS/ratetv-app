import 'package:flutter/material.dart';
import 'package:project_a/my_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:project_a/service/local_cache_service.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await initializeDateFormatting('pt_BR', null);
  await LocalCacheService.shared.init();

  runApp(const MyApp());
}
