import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_professional/bloc/words/words_bloc.dart';

class MockWordsBloc extends MockBloc<WordsEvent, WordsState> implements WordsBloc{}
