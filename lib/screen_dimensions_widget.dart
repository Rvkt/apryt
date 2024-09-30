import 'package:flutter/material.dart';

class ScreenDimensionsWidget extends StatelessWidget {
  const ScreenDimensionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    TextStyle? textStyle = Theme.of(context).textTheme.titleSmall?.copyWith(fontFamily: 'monospace');

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Screen Dimensions: ${width.toStringAsFixed(2)} x ${height.toStringAsFixed(2)}',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
