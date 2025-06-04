import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MarkdownProvider with ChangeNotifier {
  String _markdownContent = "";
  bool _isLoading = false;

  String get markdownContent => _markdownContent;
  bool get isLoading => _isLoading;

  /// Sets the loading state and notifies listeners.
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Loads markdown content from assets, falls back to default if not found.
  Future<bool> loadMarkdownContent(String filePath) async {
    setLoading(true);

    try {
      _markdownContent = await rootBundle.loadString(filePath);
      setLoading(false);
      return true; // Successfully loaded the file
    } catch (e) {
      debugPrint("Error loading markdown file: $e. Loading default markdown.");
      _markdownContent = await _loadDefaultMarkdown();
      setLoading(false);
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
