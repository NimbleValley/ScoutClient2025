
import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle labelTextStyle = const TextStyle(
    fontSize: 40,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

class CustomTextInputDecoration {
  static InputDecoration customInputDecoration = const InputDecoration(
    hintText: 'eg. 3197',
    hintStyle:
    TextStyle(fontSize: 20, color: Color(0xFF4a4a4a)),
    isDense: true,
    // Added this
    contentPadding: EdgeInsets.symmetric(
        vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.deepOrangeAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.deepOrangeAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  );
}