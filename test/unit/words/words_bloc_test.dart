import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_professional/api.dart';
import 'package:flutter_professional/bloc/words/words_bloc.dart';
import 'package:flutter_professional/model/words/word.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/api_mock.dart';

main() {
  late WordsBloc wordsBloc;
  late API mockAPI;
  setUp(() {
    mockAPI = MockAPI();
    wordsBloc = WordsBloc(api: mockAPI);
  });
  tearDown(() {
    wordsBloc.close();
  });

  var words = <Word>[
    const Word(en: "green", tr: "yeşil"),
    const Word(en: "red", tr: "kırmızı")
  ];

  test("initial state is WordsInitial", () {
    expect(wordsBloc.state, WordsInitial());
  });

  blocTest<WordsBloc, WordsState>(
    "emits WordsUploaded when LoadWords is added",
    build: () {
      when(() => mockAPI.getWords()).thenAnswer((_) => Future.value(words));
      return wordsBloc;
    },
    act: (bloc) => bloc.add(LoadWords()),
    expect: () => [WordsUploaded(words: words)],
    verify: (_) {
      verify(() => mockAPI.getWords()).called(1);
    },
  );
}
