import 'package:flutter/material.dart';

class LineComponent extends StatelessWidget {
  const LineComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Divider(
        color: Colors.white70,
        height: 1.0,
        thickness: 1.0,
        indent: 25.0,
        endIndent: 25.0,
      ),
    );
  }
}
