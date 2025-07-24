class BasicMovieParser {
  static List<int> parseGenreIds(dynamic ids) {
    if (ids is List) {
      return ids.map((e) {
        if (e is int) return e;
        if (e is String) return int.tryParse(e) ?? 0;
        return 0;
      }).toList();
    }

    return [];
  }

  static int parseId(dynamic id) {
    if (id is int && id > 0) {
      return id;
    } else if (id is String) {
      final parsed = int.tryParse(id);
      if (parsed != null && parsed > 0) return parsed;
    }

    //throw MovieIdException(id: id);
    return -1;
  }

  static String parseTitle(dynamic title) {
    String parsed = title?.toString().trim() ?? "";
    if (parsed.isEmpty) return "Sem título";

    return parsed;
  }

  static String parseOverview(dynamic overview) {
    String parsed = overview?.toString().trim() ?? "";
    if (parsed.isEmpty) {
      return "Descrição não disponível.";
    }

    return parsed;
  }

  static String parseImage(dynamic imageSrc) {
    String parsed = imageSrc?.toString().trim() ?? "";
    if (parsed.isEmpty) return "";
    return parsed;
  }

  static DateTime parseDateTime(dynamic dateTime) {
    if (dateTime is DateTime) {
      return dateTime;
    } else if (dateTime is String) {
      DateTime? parsed = DateTime.tryParse(dateTime);
      return parsed ?? DateTime(1970, 1, 1);
    }

    return DateTime(1970, 1, 1);
  }

  static int parseInt(dynamic value) {
    if (value is int && value > 0) {
      return value;
    } else if (value is String) {
      final parsed = int.tryParse(value);
      if (parsed != null && parsed > 0) return parsed;
    }

    //throw MovieIdException(id: id);
    return 0;
  }

  static double parseDouble(dynamic value) {
    if (value is double && value > 0) {
      return value;
    } else if (value is String) {
      final parsed = double.tryParse(value);
      if (parsed != null && parsed > 0) return parsed;
    }

    //throw MovieIdException(id: id);
    return 0;
  }
}
