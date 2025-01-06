import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle labelTextStyle = const TextStyle(
    fontSize: 45,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle labelTextStyleUnbold = const TextStyle(
    fontSize: 35,
    color: Colors.grey,
    fontWeight: FontWeight.normal,
  );
}

class CustomTextInputDecoration {
  static InputDecoration createCustomInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 20, color: Color(0xFF4a4a4a)),
      isDense: true,
      // Added this
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
  }
}
