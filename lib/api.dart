import 'dart:convert';

import 'config.dart';
import 'model/words/word.dart';
import 'package:http/http.dart' as http;

class API {
  final Config config;

  const API({required this.config});

  Future<List<Word>> getWords() async {
    try {
      var response = await http.get(Uri.parse('${Config.baseURL}/words'));
      List<Word> words = (json.decode(response.body) as List)
          .map((i) => Word.fromJson(i))
          .toList();
      return words;
    } catch (e) {
      print(e.toString());
      return <Word>[];
    }
  }
}
