import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_professional/bloc/words/words_bloc.dart';
import 'package:flutter_professional/main.dart';
import 'package:flutter_professional/widgets/home/words_widget.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/bloc_mock.dart';

main() {
  testWidgets("MyApp", (WidgetTester tester) async {
    var widget = const MyApp();
    await tester.pumpWidget(widget);

    Finder finderMaterialApp = find.byKey(const Key("MyApp-MaterialApp"));
    expect(finderMaterialApp, findsOneWidget);

    MaterialApp materialApp = tester.widget(finderMaterialApp);
    expect(materialApp.debugShowCheckedModeBanner, false);

    ThemeData themeData = materialApp.theme!;
    expect(themeData.primaryColor, Colors.blue);

    expect(materialApp.home.runtimeType, MyHomePage);
    Finder finderMyHomePage = find.byType(MyHomePage);
    expect(finderMyHomePage, findsOneWidget);
    MyHomePage myHomePage = tester.widget(finderMyHomePage);
    expect(myHomePage.title, "Flutter App");
  });

  testWidgets("MyHomePage", (WidgetTester tester) async {
    var widget = const MaterialApp(
      home: MyHomePage(title: "Flutter App"),
    );

    await tester.pumpWidget(widget);

    Finder finderScaffold = find.byType(Scaffold);
    expect(finderScaffold, findsOneWidget);

    Scaffold scaffold = tester.widget(finderScaffold);
    expect(scaffold.appBar.runtimeType, AppBar);
    expect(scaffold.body.runtimeType, Center);

    AppBar appBar = scaffold.appBar as AppBar;
    expect(appBar.title.runtimeType, Text);
    Text appBarTitleText = appBar.title! as Text;
    expect(appBarTitleText.data, "Flutter App");

    Center bodyCenter = scaffold.body! as Center;
    expect(bodyCenter.child.runtimeType, Words);
  });
}
