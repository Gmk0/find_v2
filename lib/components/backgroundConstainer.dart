import 'package:find_v2/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundConstainer extends StatelessWidget {
  const BackgroundConstainer({super.key, required this.child, this.color});

  final Widget child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      decoration: BoxDecoration(
          color: color ?? lightPrimary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
      child: child,
    );
  }
}
