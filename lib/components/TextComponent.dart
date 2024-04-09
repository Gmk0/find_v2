import 'package:flutter/material.dart';
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
        fontSize: size,
        color: color ?? backgroundColor,
        fontWeight: fw,
      ),
    );
  }
}
