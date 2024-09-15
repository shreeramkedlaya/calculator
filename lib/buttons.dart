// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final color;
  final textcolor;
  final String buttontext;
  final onTap;
  const Button({
    super.key,
    this.color,
    this.textcolor,
    required this.buttontext,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttontext,
                style: TextStyle(color: textcolor, fontSize: 32),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
