import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_professional/api.dart';
import 'package:flutter_professional/model/words/word.dart';
import 'package:meta/meta.dart';

part 'words_event.dart';

part 'words_state.dart';

class WordsBloc extends Bloc<WordsEvent, WordsState> {
  final API api;

  WordsBloc({required this.api}) : super(WordsInitial()) {
    on<LoadWords>((event, emit) async {
      final List<Word> words = await api.getWords();
      if (words.isEmpty) {
        emit(WordsInitial());
        return;
      }
      emit(WordsUploaded(words: words));
    });
  }
}
