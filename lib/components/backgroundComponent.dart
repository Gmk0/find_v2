import 'package:flutter/material.dart';

class ThemedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const ThemedContainer({
    Key? key,
    required this.child,
    this.margin,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final Color backgroundColor =
        brightness == Brightness.dark ? Colors.grey[900]! : Colors.white;
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
