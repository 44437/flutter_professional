part of 'words_bloc.dart';

@immutable
abstract class WordsState extends Equatable {
  const WordsState();

  @override
  List<Object> get props => [];
}

class WordsInitial extends WordsState {}

class WordsUploaded extends WordsState {
  final List<Word> words;

  const WordsUploaded({required this.words});

  @override
  List<Object> get props => [words];
}
