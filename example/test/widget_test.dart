// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('We can find all elements defined', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());
    final richTextWidget =
        tester.element(find.byType(RichText).first).widget as RichText;
    final textSpan = richTextWidget.text as TextSpan;
    expect(textSpan.children!.length, 16);
    expect((textSpan.children![0] as TextSpan).text, "This is a ");
    expect((textSpan.children![3] as TextSpan).text, "with a link");
    expect(
        (textSpan.children![3] as TextSpan).style!.fontStyle, FontStyle.normal);
    expect((textSpan.children![3] as TextSpan).style!.decoration,
        TextDecoration.underline);
    expect((textSpan.children![5] as TextSpan).style!.decoration,
        TextDecoration.underline);
    expect((textSpan.children![7] as TextSpan).style!.decoration,
        TextDecoration.underline);
    expect((textSpan.children![8] as TextSpan).style!.decoration,
        TextDecoration.underline);
    expect((textSpan.children![4] as TextSpan).recognizer, null);
    expect((textSpan.children![4] as TextSpan).recognizer, null);
    expect((textSpan.children![8] as TextSpan).recognizer, isNot(null));
    expect((textSpan.children![10] as TextSpan).style!.color,
        Color.fromRGBO(255, 0, 0, 1));
    expect((textSpan.children![12] as TextSpan).style!.color,
        Colors.deepPurpleAccent);
    expect((textSpan.children![14] as TextSpan).style!.color, Colors.green);
  });
}
