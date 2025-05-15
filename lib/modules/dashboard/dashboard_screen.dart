import 'package:apryt/modules/dashboard/widgets/topic_card.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../data/questions_list.dart';
import '../../data/topics_list.dart';
import '../questions/questions_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('Flutter Topics'),
        centerTitle: true,
        backgroundColor: AppColors.darkBlue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QuestionsScreen(questions: questions),
                ),
              );
            },
            child: Card(
              elevation: 0,
              margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Questions',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF02569B),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Flutter related interview questions.',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: topics.length,
              itemBuilder: (context, index) {
                final topic = topics[index];
                return TopicCard(
                  topic: topic,
                  onTap: () {
                    Navigator.pushNamed(context, topic.route);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
