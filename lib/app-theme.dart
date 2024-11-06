import 'package:flutter/material.dart';

class AppTheme {
  static const primaryLinearGradient =
      LinearGradient(colors: [primaryColor, secondaryColor]);
  static const primaryColor = Color(0xFF3E60AC);
  static const secondaryColor = Color(0xFF58B0F0);
  static const footerTextColor = Color(0xFF313131);
  static const footerTextColorActive = Color(0xFF55a4e0);

  static textField(String labelText, String hintText) {
    return TextField(
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          filled: true,
          fillColor: Color(0x88FFFFFF),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30))),
    );
  }

  static Padding wrapField(Widget widget){
    return Padding(padding: const EdgeInsets.symmetric(vertical: 5), child: widget);
  }

  static InputDecoration appTextField(String labelText, String hintText){
    return InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(color: Color(0xFF1E1E1E)),
        filled: true,
        fillColor: Color(0x88FFFFFF),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30)
        )
    );
  }
}
