import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:markup_text/markup_text.dart';

void main() {
  testWidgets('MarkupText widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MarkupText(
        "This is (b)bold(/b) test (a http://flutter.dev)with a first link(/a)"
            " and a simple (u)underlined(/u) text and (a http://pub.dev)with"
            " a second (i)italic(/i) link(/a) and a (c #ff0000)red(/c) word"
            " and a (c deepPurpleAccent)deepPurpleAccent(/c) one"));
    final richTextWidget =
        tester.element(find.byType(RichText)).widget as RichText;
    final textSpan = richTextWidget.text as TextSpan;
    expect(textSpan.children.length, 15);
    expect((textSpan.children[0] as TextSpan).text, "This is ");
    expect((textSpan.children[3] as TextSpan).text, "with a first link");
    expect(
        (textSpan.children[3] as TextSpan).style.fontStyle, FontStyle.normal);
    expect((textSpan.children[3] as TextSpan).style.decoration,
        TextDecoration.underline);
    expect((textSpan.children[5] as TextSpan).style.decoration,
        TextDecoration.underline);
    expect((textSpan.children[7] as TextSpan).style.decoration,
        TextDecoration.underline);
    expect((textSpan.children[8] as TextSpan).style.decoration,
        TextDecoration.underline);
    expect((textSpan.children[9] as TextSpan).style.decoration,
        TextDecoration.underline);
    expect((textSpan.children[4] as TextSpan).recognizer, null);
    expect((textSpan.children[4] as TextSpan).recognizer, null);
    expect((textSpan.children[9] as TextSpan).recognizer, isNot(null));
    expect((textSpan.children[11] as TextSpan).style.color, Color.fromRGBO(255, 0, 0, 1));
    expect((textSpan.children[13] as TextSpan).style.color, Colors.deepPurpleAccent);
  });
}
