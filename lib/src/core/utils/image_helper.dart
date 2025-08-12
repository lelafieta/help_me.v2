import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../core/gen/assets.gen.dart';

class ImageHelper {
  static String buildImageUrl(String path) {
    final baseUrl = dotenv.env['API_URL'] ?? '';

    // Evita barra duplicada
    if (path.startsWith('/')) {
      path = path.substring(1);
    }

    return '$baseUrl/$path';
  }

  static Widget showImage(
    String? imagePath, {
    double? width,
    double? height,
    bool isUser = true,
  }) {
    if (imagePath == null) {
      if (isUser == false) {
        return Image.asset(
          fit: BoxFit.cover,
          Assets.images.placeholder.path,
          width: width ?? 45,
          height: height ?? 45,
        );
      }
      return Image.asset(
        fit: BoxFit.cover,
        Assets.images.userAvatar.path,
        width: width ?? 45,
        height: height ?? 45,
      );
    }
    return CachedNetworkImage(
      imageUrl: buildImageUrl(imagePath),
      fit: BoxFit.cover,
      width: width ?? 45,
      height: height ?? 45,
      progressIndicatorBuilder: (context, url, progress) => Container(
        width: 20,
        height: 20,
        padding: EdgeInsets.all(10),
        child: CircularProgressIndicator(
          value: progress.progress,
          strokeWidth: 20,
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        fit: BoxFit.cover,
        Assets.images.nopeNotHere,
        width: width ?? 45,
        height: height ?? 45,
      ),
    );
  }
}
