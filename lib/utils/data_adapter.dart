import 'dart:core';

class DataAdapter {
  static int parseInt(dynamic value, int defaultValue) {
    if (value is int && value >= 0) {
      return value;
    } else if (value is String) {
      final parsed = int.tryParse(value);
      if (parsed != null && parsed >= 0) return parsed;
    }
    return defaultValue;
  }

  static double parseDouble(dynamic value, double defaultValue) {
    if (value is double && value > 0) {
      return value;
    } else if (value is String) {
      final parsed = double.tryParse(value);
      if (parsed != null && parsed > 0) return parsed;
    }
    return defaultValue;
  }

  static bool parseBool(dynamic value, bool defaultValue) {
    if (value is bool) {
      return value;
    } else if (value is String) {
      bool? parsed = bool.tryParse(value.toLowerCase());
      if (parsed != null) return parsed;
    }

    return defaultValue;
  }

  static String parseString(dynamic value, String defaultValue) {
    String parsed = value?.toString().trim() ?? "";
    if (parsed.isNotEmpty) return parsed;

    return defaultValue;
  }

  static List<int> parseIntList(dynamic value, List<int> defaultValue) {
    if (value is List<int>) {
      return value;
    } else if (value is String) {
      return value
          .split(",")
          .map((e) => int.tryParse(e.trim()))
          .where((e) => e != null)
          .cast<int>()
          .toList();
    }

    return [];
  }

  static DateTime parseDateTime(dynamic value, DateTime defaultValue) {
    if (value is DateTime) {
      return value;
    } else if (value is String) {
      DateTime? parsed = DateTime.tryParse(value);
      if (parsed != null) return parsed;
    }

    return defaultValue;
  }
}
