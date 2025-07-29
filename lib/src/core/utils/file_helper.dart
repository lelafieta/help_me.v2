import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_filex/open_filex.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FileHelper {
  static Widget buildPreview(String path) {
    final extension = path.split('.').last.toLowerCase();

    if (['jpg', 'jpeg', 'png'].contains(extension)) {
      return Image.file(File(buildFileUrl(path)));
    } else if (extension == 'pdf') {
      return SfPdfViewer.file(File(buildFileUrl(path)));
    } else if ([
      'doc',
      'docx',
      'ppt',
      'pptx',
      'xls',
      'xlsx',
      'txt',
    ].contains(extension)) {
      final url =
          'https://docs.google.com/gview?embedded=true&url=${buildFileUrl(path)}';
      // return WebView(initialUrl: url);
      return SizedBox.shrink();
    } else {
      return const Text('Formato não suportado para visualização');
    }
  }

  static String buildFileUrl(String path) {
    final baseUrl = dotenv.env['API_URL'] ?? '';

    if (path.startsWith('/')) {
      path = path.substring(1);
    }

    return '$baseUrl/$path';
  }
}
