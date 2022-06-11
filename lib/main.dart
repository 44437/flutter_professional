import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_professional/api.dart';
import 'package:flutter_professional/config.dart';
import 'package:flutter_professional/bloc/words/words_bloc.dart';
import 'package:flutter_professional/widgets/home/words_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: const Key("MyApp-MaterialApp"),
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _api = API(config: Config());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => WordsBloc(api: _api)..add(LoadWords()))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const Center(
          child: Words(),
        ),
      ),
    );
  }
}
