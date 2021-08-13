import 'package:flutter/material.dart';

class MyAppButton extends StatelessWidget {
  final String txt;
  final void Function() onPressed;
  const MyAppButton({Key? key, required this.txt, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: onPressed,
        child: Text(
          '$txt',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        color: Color(0xFF000000), // Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
