import 'package:apryt/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

import '../../core/themes/draculaMarkdownTheme.dart';
import '../../models/topic.dart';
import '../../modules/markdown/providers/markdown_provider.dart';

class TopicDetailsScreen extends StatelessWidget {
  final Topic topic;
  const TopicDetailsScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade50,
        foregroundColor: AppColors.darkBlue,
        elevation: 0,
        title: Text(
          topic.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 0,
              color: Colors.white.withAlpha(80),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  topic.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'monospace',
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Consumer<MarkdownProvider>(
                builder: (context, markdownProvider, child) {
                  return Markdown(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    data: markdownProvider.markdownContent,
                    softLineBreak: false,
                    styleSheet: draculaMarkdownStyle,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
