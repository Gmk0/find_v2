import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextName extends StatelessWidget {
  const TextName(
      {super.key,
      required this.name,
      this.size,
      this.fw,
      this.color,
      required this.taille});

  final String name;

  final double? size;
  final FontWeight? fw;
  final Color? color;
  final int taille;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final Color backgroundColor =
        brightness == Brightness.dark ? Colors.grey[100]! : Colors.grey[900]!;
    return Text(
      name.length <= taille ? name : '${name.substring(0, taille)}...',
      maxLines: 1,
      overflow: TextOverflow.fade,
      softWrap: false,
      style: GoogleFonts.poppins(
        fontSize: size?.sp,
        color: color ?? backgroundColor,
        fontWeight: fw,
      ),
    );
  }
}
