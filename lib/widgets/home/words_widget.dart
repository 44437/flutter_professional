import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_professional/bloc/words/words_bloc.dart';
import 'package:flutter_professional/widgets/home/word_card.dart';

class Words extends StatelessWidget {
  const Words({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordsBloc, WordsState>(
      builder: (context, state) {
        try {
          if (state is WordsInitial) {
            return const CircularProgressIndicator();
          } else if (state is WordsUploaded) {
            return ListView.builder(
                itemCount: state.words.length,
                itemBuilder: (context, index) {
                  return WordCard(word: state.words[index]);
                });
          }
          return const CircularProgressIndicator();
        } catch (exception) {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
