import 'package:find_v2/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundConstainer extends StatelessWidget {
  const BackgroundConstainer({super.key, required this.child, this.color});

  final Widget child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final Color backgroundColor =
        brightness == Brightness.dark ? Colors.grey[900]! : Colors.grey[100]!;
    return Container(
      width: width,
      height: heigth,
      decoration: BoxDecoration(
          // color: backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
      child: child,
    );
  }
}
