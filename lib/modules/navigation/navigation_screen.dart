import 'package:apryt/core/services/markdown_service.dart';
import 'package:apryt/modules/dashboard/widgets/topic_card.dart';
import 'package:flutter/material.dart';

import '../../core/utils/snack_bar_utils.dart';
import '../../data/topics/navigations_topics.dart';
import '../markdown/topic_details_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  Future<bool> _loadMarkdown(BuildContext context, {required String filePath}) async {
    bool exists = await MarkdownService.loadMarkdown(
      context: context,
      filePath: filePath,
    );

    SnackBarUtil.show(
      exists ? "Markdown file loaded successfully." : "Markdown file not found. Default content is loaded.",
      backgroundColor: exists ? Colors.green : Colors.red,
    );

    return exists; // ✅ Add this line
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: navigationTopics.length,
        itemBuilder: (context, index) {
          final topic = navigationTopics[index];
          return TopicCard(
            topic: topic,
            onTap: () async {
              if (topic.filePath != null) {
                // Try to load markdown first
                bool loaded = await _loadMarkdown(context, filePath: topic.filePath!);

                // Only navigate if file was found or fallback markdown was loaded
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopicDetailsScreen(topic: topic),
                    ),
                  );
                }
              } else {
                SnackBarUtil.show(
                  'No file path provided for this topic.',
                  backgroundColor: Colors.red,
                );
              }
            },
          );
        },
      ),
    );
  }
}
