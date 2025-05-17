import 'package:flutter/material.dart';

class LifecycleScreen extends StatefulWidget {
  const LifecycleScreen({super.key});

  @override
  State<LifecycleScreen> createState() => _LifecycleScreenState();
}

class _LifecycleScreenState extends State<LifecycleScreen> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('🔵 initState called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('🟡 didChangeDependencies called');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢 build called');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lifecycle Demo'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Demo'),
                Tab(text: 'Code'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildDemoTab(),
                  _buildCodeTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDemoTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Flutter Widget Lifecycle Explained',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Check the console to see which lifecycle methods are called as you interact with the screen.',
          ),
          const SizedBox(height: 20),
          Text('Counter: $counter', style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: const Text('Increment Counter'),
          ),
          const SizedBox(height: 20),
          const LifecycleSummary(),
        ],
      ),
    );
  }

  Widget _buildCodeTab() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: SelectableText(
          '''
class LifecycleScreen extends StatefulWidget {
  const LifecycleScreen({super.key});

  @override
  State<LifecycleScreen> createState() => _LifecycleScreenState();
}

class _LifecycleScreenState extends State<LifecycleScreen> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('🔵 initState called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('🟡 didChangeDependencies called');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢 build called');
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Lifecycle Demo')),
      body: Center(child: Text('Counter: \$counter')),
    );
  }

  @override
  void didUpdateWidget(covariant LifecycleScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('🟠 didUpdateWidget called');
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint('⚫ deactivate called');
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint('🔴 dispose called');
  }
}
          ''',
          style: TextStyle(fontFamily: 'monospace', fontSize: 12),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant LifecycleScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('🟠 didUpdateWidget called');
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint('⚫ deactivate called');
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint('🔴 dispose called');
  }
}

class LifecycleSummary extends StatelessWidget {
  const LifecycleSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '🔄 Lifecycle Methods:\n\n'
      '🔵 initState: Called once when the widget is inserted.\n'
      '🟡 didChangeDependencies: Called after initState & when dependencies change.\n'
      '🟢 build: Called whenever setState is triggered.\n'
      '🟠 didUpdateWidget: Called when widget configuration changes.\n'
      '⚫ deactivate: Called before dispose, when widget is removed.\n'
      '🔴 dispose: Called when the widget is permanently removed.\n',
      style: TextStyle(fontSize: 14),
    );
  }
}
