import 'package:flutter/material.dart';

class WordCardText extends StatelessWidget {
  final String text;

  const WordCardText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 17),
    );
  }
}
