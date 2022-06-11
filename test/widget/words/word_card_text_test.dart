import 'package:flutter/material.dart';
import 'package:flutter_professional/widgets/home/word_card_text.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets("word card text", (WidgetTester tester) async {
    const widget = MaterialApp(home: WordCardText(text: "apple"));
    await tester.pumpWidget(widget);
    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);

    Text text = tester.widget(textFinder);
    expect(text.style!.fontSize, 17);
  });
}
