import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_professional/api.dart';
import 'package:flutter_professional/bloc/words/words_bloc.dart';
import 'package:flutter_professional/main.dart';
import 'package:flutter_professional/model/words/word.dart';
import 'package:flutter_professional/widgets/home/word_card.dart';
import 'package:flutter_professional/widgets/home/words_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/api_mock.dart';
import '../../mocks/bloc_mock.dart';

main() {
  late WordsBloc mockWordsBloc;
  setUp(() {
    mockWordsBloc = MockWordsBloc();
  });
  tearDown(() {
    mockWordsBloc.close();
  });

  var words = <Word>[
    const Word(en: "green", tr: "yeşil"),
    const Word(en: "red", tr: "kırmızı")
  ];

  testWidgets("state is WordsInitial", (WidgetTester tester) async {
    when(() => mockWordsBloc.state).thenAnswer((_) => WordsInitial());
    var widget = BlocProvider.value(
      value: mockWordsBloc,
      child: const MaterialApp(home: Words()),
    );
    await tester.pumpWidget(widget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets("state is WordsUploaded", (WidgetTester tester) async {
    when(() => mockWordsBloc.state)
        .thenAnswer((_) => WordsUploaded(words: words));

    var widget = BlocProvider.value(
      value: mockWordsBloc,
      child: const MaterialApp(home: Words()),
    );

    await tester.pumpWidget(widget);

    var finderListView = find.byType(ListView);
    expect(finderListView, findsOneWidget);

    var finderWordCard = find.byType(WordCard);
    expect(finderWordCard, findsNWidgets(2));
  });
}
