import 'package:apryt/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screen_dimensions_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<bool?> _showDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit the App?'),
          content: const Text('Are you sure you want to leave the app?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes, exit the app'),
              onPressed: () {
                // Return true to indicate the user confirmed exit
                Navigator.pop(context, true);
              },
            ),
            TextButton(
              child: const Text('No, stay in the app'),
              onPressed: () {
                // Return false to indicate the user canceled the exit
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await _showDialog() ?? false;
        if (shouldPop) {
          // Since this is the root route, quit the app where possible by
          // invoking the SystemNavigator. If this wasn't the root route,
          // then Navigator.maybePop could be used instead.
          // See https://github.com/flutter/flutter/issues/11490
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    title: const Text('apryt'),
    centerTitle: true,
    elevation: 4,
  );
}

Center _buildBody(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: _buildContent(context),
    ),
  );
}

Column _buildContent(BuildContext context) {
  ScreenUtil.init(context);
  double height = ScreenUtil.screenHeight;
  double width = ScreenUtil.screenWidth;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

      Text(
        'Welcome to apryt!',
        style: Theme.of(context).textTheme.displayLarge,
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 16),
      Text(
        'Your playground for Flutter concepts and experimentation.',
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 16),
      ScreenDimensionsWidget(),
    ],
  );
}
