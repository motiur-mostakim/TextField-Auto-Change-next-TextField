import 'package:flutter/material.dart';
import 'package:textfield_auto_chnage_next_textfield/text_field_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AutoNextTextFieldExample(),
    );
  }
}
