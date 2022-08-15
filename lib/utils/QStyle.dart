import 'package:flutter/material.dart';

BoxDecoration boxDecorations({double radius = 8, Color color = Colors.transparent, Color bgColor = Colors.white, var showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 0.1,
          spreadRadius: 0.1,
          offset: Offset(0.1, 0.1), // shadow direction: bottom right
        )
      ],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

