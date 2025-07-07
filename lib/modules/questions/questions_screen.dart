import 'package:apryt/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../models/question.dart';

class QuestionsScreen extends StatelessWidget {
  final List<Question> questions;

  const QuestionsScreen({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('Questions'),
        backgroundColor: AppColors.darkBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent, // Hide expansion lines
        ),
        child: ListView.builder(
          itemCount: questions.length,
          padding: EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final q = questions[index];
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                title: Text(
                  q.question,
                  style: const TextStyle(
                    color: Color(0xFF02569B),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Card(
                      color: Colors.blue.shade50,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          q.answer,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
