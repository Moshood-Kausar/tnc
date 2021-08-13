import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color color;
  const NewButton(
      {Key? key, required this.text, this.onTap, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28,
        width: 120,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.openSans(
                fontSize: 12,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
