import 'package:apryt/modules/markdown/providers/markdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarkdownService {
  /// Returns true if the markdown was loaded successfully, false if fallback was used.
  static Future<bool> loadMarkdown({
    required BuildContext context,
    required String filePath,
  }) async {
    final markdownProvider = Provider.of<MarkdownProvider>(context, listen: false);
    return await markdownProvider.loadMarkdownContent(filePath);
  }
}
