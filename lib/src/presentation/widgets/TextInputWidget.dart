import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final controller = TextEditingController();
  final labelText;
  final maxLines;

  TextInputWidget({
    this.labelText,
    this.maxLines = 1
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: "Texto a guardar",
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 14, color: Colors.black45),
          border: OutlineInputBorder()),
      keyboardType: TextInputType.name,
      obscureText: false,
      maxLines: maxLines,
    );
  }

  String getText(){
    return controller.text;
  }
}