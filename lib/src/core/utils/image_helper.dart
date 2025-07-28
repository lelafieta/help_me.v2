import 'package:flutter_dotenv/flutter_dotenv.dart';

class ImageHelper {
  static String buildImageUrl(String path) {
    final baseUrl = dotenv.env['API_URL'] ?? '';

    // Evita barra duplicada
    if (path.startsWith('/')) {
      path = path.substring(1);
    }

    return '$baseUrl/$path';
  }
}
