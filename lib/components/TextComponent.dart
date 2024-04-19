import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextComponent extends StatelessWidget {
  const TextComponent({
    super.key,
    required this.text,
    required this.size,
    this.color,
    this.fw,
  });
  final String text;
  final double? size;
  final FontWeight? fw;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final Color backgroundColor =
        brightness == Brightness.dark ? Colors.grey[100]! : Colors.grey[900]!;
    return Text(
      text,
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

class ReusableText extends StatelessWidget {
  const ReusableText({super.key, required this.text, required this.style});
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.fade,
      softWrap: false,
      style: style,
    );
  }
}

TextStyle appStyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.poppins(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}
