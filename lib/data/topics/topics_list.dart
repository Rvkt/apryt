import '../../models/topic.dart';

final List<Topic> topics = [
  Topic(title: 'Navigation', route: '/navigation', level: 'Beginner', description: 'Learn how to move between screens.'),
  Topic(title: 'Forms & Validation', route: '/forms', level: 'Beginner', description: 'Handle user input and validate forms.'),
  Topic(title: 'Custom Widgets', route: '/customWidgets', level: 'Beginner', description: 'Create reusable UI components.'),
  Topic(title: 'State Management', route: '/stateManagement', level: 'Intermediate', description: 'Manage and share app state effectively.'),
  Topic(title: 'HTTP Requests', route: '/httpRequests', level: 'Intermediate', description: 'Fetch and send data over the internet.'),
  Topic(title: 'Local Storage', route: '/localStorage', level: 'Intermediate', description: 'Save data locally on the device.'),
  Topic(title: 'Infinite Scrolling', route: '/infiniteScroll', level: 'Intermediate', description: 'Load more data as the user scrolls down the list.'),
  Topic(title: 'Firebase Integration', route: '/firebase', level: 'Advanced', description: 'Use Firebase services in your app.'),
  Topic(title: 'Camera Access', route: '/camera', level: 'Advanced', description: 'Capture photos and videos using the device camera.'),
  Topic(title: 'Notifications', route: '/notifications', level: 'Advanced', description: 'Send and receive push notifications.'),
  Topic(title: 'Animations', route: '/animations', level: 'Advanced', description: 'Add visual effects to enhance UX.'),
];
