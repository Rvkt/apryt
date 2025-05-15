import 'package:apryt/models/topic.dart';
import 'package:apryt/modules/dashboard/widgets/topic_card.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

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
            onTap: () {
              Navigator.pushNamed(context, topic.route);
            },
          );
        },
      ),
    );
  }
}

final List<Topic> navigationTopics = [
  Topic(
    title: 'Basic Push Navigation',
    route: '/basicPush',
    level: 'Beginner',
    description: 'Navigate to a new screen using Navigator.push().',
  ),
  Topic(
    title: 'Push Replacement',
    route: '/pushReplacement',
    level: 'Intermediate',
    description: 'Replace current screen using Navigator.pushReplacement().',
  ),
  Topic(
    title: 'Push And Remove Until',
    route: '/pushAndRemoveUntil',
    level: 'Intermediate',
    description: 'Clear stack and push a new screen using Navigator.pushAndRemoveUntil().',
  ),
  Topic(
    title: 'Named Route Navigation',
    route: '/namedRoute',
    level: 'Beginner',
    description: 'Navigate using Navigator.pushNamed() with predefined routes.',
  ),
  Topic(
    title: 'Send & Receive Data',
    route: '/sendData',
    level: 'Intermediate',
    description: 'Pass data between screens and return results using Navigator.pop().',
  ),
  Topic(
    title: 'Navigation with Arguments',
    route: '/arguments',
    level: 'Intermediate',
    description: 'Pass complex objects using settings.arguments.',
  ),
  Topic(
    title: 'Bottom Navigation Bar',
    route: '/bottomNav',
    level: 'Intermediate',
    description: 'Switch between tabs using BottomNavigationBar.',
  ),
  Topic(
    title: 'Drawer Navigation',
    route: '/drawerNav',
    level: 'Beginner',
    description: 'Navigate using a side drawer menu.',
  ),
  Topic(
    title: 'PageView Navigation',
    route: '/pageView',
    level: 'Advanced',
    description: 'Implement swipe-based navigation using PageView.',
  ),
  Topic(
    title: 'GoRouter (Flutter 3.0)',
    route: '/goRouter',
    level: 'Advanced',
    description: 'Use declarative navigation with GoRouter for scalable apps.',
  ),
];
