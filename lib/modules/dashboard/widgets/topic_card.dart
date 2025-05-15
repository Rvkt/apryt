import 'package:flutter/material.dart';

import '../../../models/topic.dart';

class TopicCard extends StatelessWidget {
  final Topic topic;
  final VoidCallback onTap;

  const TopicCard({
    super.key,
    required this.onTap,
    required this.topic,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                topic.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF02569B),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Level: ${topic.level}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                topic.description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
