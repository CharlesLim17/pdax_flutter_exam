import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  // Relase mode
  static String get fileName =>
      kReleaseMode ? ".env.production" : ".env.development";

  // API URL
  static String get apiUrl => dotenv.env['API_URL'] ?? 'API_URL NOT FOUND';
}
