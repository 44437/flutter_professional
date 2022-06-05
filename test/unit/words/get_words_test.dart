import 'package:flutter_professional/api.dart';
import 'package:flutter_professional/model/words/word.dart';
import 'package:flutter_professional/bloc/words/words_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/api_mock.dart';

main() {
  late API mockAPI;
  late WordsBloc wordsBloc;
  setUp(() {
    mockAPI = MockAPI();
    wordsBloc = WordsBloc(api: mockAPI);
  });
  tearDown(() {
    wordsBloc.close();
  });

  test("should return words", () async {
    var words = <Word>[
      const Word(en: "green", tr: "yeşil"),
      const Word(en: "red", tr: "kırmızı")
    ];

    when(() => mockAPI.getWords()).thenAnswer((_) => Future.value(words));
    wordsBloc.add(LoadWords());
    await Future.delayed(const Duration(milliseconds: 500));
    expect(wordsBloc.state, WordsUploaded(words: words));

    verify(() => mockAPI.getWords()).called(1);
  });

  test("should return error", () async {
    const emptyWordList = <Word>[];
    expect(emptyWordList.isEmpty, true);

    when(() => mockAPI.getWords())
        .thenAnswer((_) => Future.value(emptyWordList));

    wordsBloc.add(LoadWords());
    await Future.delayed(const Duration(milliseconds: 500));

    expect(wordsBloc.state, WordsInitial());
    verify(() => mockAPI.getWords()).called(1);
  });
}
