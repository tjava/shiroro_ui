import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final bool? underline;

  const CustomText({
    Key? key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.underline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          fontSize: size ?? 16,
          color: color ?? Colors.black,
          fontWeight: weight ?? FontWeight.normal,
          decoration:
              underline! ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
