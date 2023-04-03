import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class GlassComponent extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  const GlassComponent({
    required this.height,
    required this.width,
    required this.child,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer.clearGlass(
      height: height,
      width: width,
      borderWidth: 0.0,
      borderRadius: BorderRadius.circular(12.0),
      blur: 6.0,
      padding: padding,
      child: child,
    );
  }
}
