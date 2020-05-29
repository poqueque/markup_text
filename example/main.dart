import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:markup_text/markup_text.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: MarkupText("(b)Markup(/b) (c yellow)(i)Example(/i)(/c)"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: MarkupText(
            "This is (b)bold(/b) test (a http://flutter.dev)with a first link(/a)"
            " and a simple (u)underlined(/u) text (a http://pub.dev)with"
            " a second (i)italic(/i) link(/a) and a (c #ff0000)red (#ff0000)(/c) word"
            " and a (c deepPurpleAccent)deepPurpleAccent(/c) one",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
