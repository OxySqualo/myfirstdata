import 'package:flutter/material.dart';

OutlineInputBorder enabledBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 3.0),
      borderRadius: BorderRadius.circular(12));
}

OutlineInputBorder focusedBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(
          color: Color.fromARGB(255, 167, 143, 134), width: 3.0),
      borderRadius: BorderRadius.circular(12));
}

Color fillColorLightBlue = const Color.fromARGB(255, 213, 234, 244);
