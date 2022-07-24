import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        child: Center(
          child: SizedBox(
            width: 33,
            height: 33,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}