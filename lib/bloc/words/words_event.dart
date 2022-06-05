part of 'words_bloc.dart';

@immutable
abstract class WordsEvent extends Equatable {
  const WordsEvent();

  @override
  List<Object> get props => [];
}

class LoadWords extends WordsEvent{}
