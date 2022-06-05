import 'package:flutter/material.dart';
import 'package:flutter_professional/model/words/word.dart';
import 'dart:math' as math;

import 'package:flutter_professional/widgets/home/word_card_text.dart';

class WordCard extends StatelessWidget {
  final Word word;

  const WordCard({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(0.7),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [WordCardText(text: word.tr), WordCardText(text: word.en)],
      ),
    );
  }
}
