import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MarkdownProvider with ChangeNotifier {
  String _markdownContent = "";
  String get markdownContent => _markdownContent;

  /// Loads markdown content from assets, falls back to default if not found.
  Future<bool> loadMarkdownContent(String filePath) async {
    try {
      _markdownContent = await rootBundle.loadString(filePath);
      notifyListeners();
      return true; // Successfully loaded the file
    } catch (e) {
      debugPrint("Error loading markdown file: $e. Loading default markdown.");
      _markdownContent = await _loadDefaultMarkdown();
      notifyListeners();
      return false; // Failed to load file, fallback to default
    }
  }

  /// Loads a default markdown file in case of an error.
  Future<String> _loadDefaultMarkdown() async {
    try {
      return await rootBundle.loadString('assets/default.md');
    } catch (e) {
      debugPrint("Error loading default markdown: $e");
      return "### Default Content\nSorry, the requested content is unavailable.";
    }
  }
}
