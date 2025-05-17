class Topic {
  final String title;
  final String route;
  final String level;
  final String description;
  final String? filePath;

  Topic({
    required this.title,
    required this.route,
    required this.level,
    required this.description,
    this.filePath,
  });
}
