import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_professional/model/words/word.dart';
import 'package:flutter_professional/widgets/home/word_card.dart';
import 'package:flutter_professional/widgets/home/word_card_text.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets("word card", (WidgetTester tester) async {
    const word = Word(en: "apple", tr: "elma");
    const widget = MaterialApp(
      home: WordCard(word: word),
    );
    await tester.pumpWidget(widget);
    var containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    Container container = tester.widget(containerFinder);
    expect(container.padding, const EdgeInsets.all(8.0));
    expect(container.margin, const EdgeInsets.all(8.0));

    BoxDecoration boxDecoration = container.decoration as BoxDecoration;
    expect(boxDecoration.borderRadius,
        const BorderRadius.all(Radius.circular(20)));

    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(WordCardText), findsNWidgets(2));
  });
}
