library markup_text;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkupText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const MarkupText(this.text, {Key key, this.textAlign = TextAlign.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextPart> partList = [];
    String current = "";
    int pointer = 0;
    List<TextType> currentTypes = [];
    String cUrl;
    String cColor;

    addPart() {
      if (current != "") {
        partList.add(
            TextPart(current, url: cUrl, color: cColor)..addAll(currentTypes));
        current = "";
      }
    }

    addType(TextType t) {
      if (!currentTypes.contains(t)) currentTypes.add(t);
    }

    removeType(TextType t) {
      if (currentTypes.contains(t)) currentTypes.remove(t);
    }

    for (int pointer = 0; pointer < text.length; pointer++) {
      List<TextType> newTypes = [];
      String newUrl;
      String newColor;
      if (text[pointer] == "(") {
        int end = text.indexOf(")", pointer);
        if (end > 0) {
          String code = text.substring(pointer + 1, end);
          switch (code) {
            case "b":
              addPart();
              addType(TextType.bold);
              pointer += 2;
              break;
            case "i":
              addPart();
              addType(TextType.italic);
              pointer += 2;
              break;
            case "u":
              addPart();
              addType(TextType.underlined);
              pointer += 2;
              break;
            case "/b":
              addPart();
              removeType(TextType.bold);
              pointer += 3;
              break;
            case "/i":
              addPart();
              removeType(TextType.italic);
              pointer += 3;
              break;
            case "/u":
              addPart();
              removeType(TextType.underlined);
              pointer += 3;
              break;
            case "/u":
              addPart();
              removeType(TextType.underlined);
              pointer += 3;
              break;
            case "/a":
              addPart();
              removeType(TextType.link);
              cUrl = null;
              pointer += 3;
              break;
            case "/c":
              addPart();
              removeType(TextType.color);
              cColor = null;
              pointer += 3;
              break;
            default:
              if (code.startsWith("a ")) {
                addPart();
                addType(TextType.link);
                cUrl = code.substring(2);
                pointer += code.length + 1;
                break;
              }
              if (code.startsWith("c ")) {
                addPart();
                addType(TextType.color);
                cColor = code.substring(2);
                pointer += code.length + 1;
                break;
              }
              current += text[pointer];
          }
        } else
          current += text[pointer];
      } else
        current += text[pointer];
    }
    addPart();

    return RichText(
      textDirection: TextDirection.ltr,
      textAlign: textAlign,
      text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: partList.map((e) => e.toSpan()).toList()),
    );
  }
}

enum TextType { link, bold, italic, underlined, color }

class TextPart {
  final String text;
  final String url;
  final String color;
  final List<TextType> types = [];

  TextPart(this.text, {this.url, this.color});

  add(TextType type) {
    types.add(type);
  }

  addAll(List<TextType> currentTypes) {
    for (TextType type in currentTypes) types.add(type);
  }

  TextSpan toSpan() {
    Color color;
    TapGestureRecognizer recognizer;
    List<TextDecoration> decorations = [];
    FontWeight fontWeight = FontWeight.normal;
    FontStyle fontStyle = FontStyle.normal;
    for (TextType type in types) {
      switch (type) {
        case TextType.link:
          color = Colors.blue;
          decorations.add(TextDecoration.underline);
          if (url != null)
            recognizer = TapGestureRecognizer()
              ..onTap = () async {
                if (await canLaunch(url)) launch(url);
              };
          break;
        case TextType.color:
          color = Colors.blue; //TODO: Process color
          break;
        case TextType.bold:
          fontWeight = FontWeight.bold;
          break;
        case TextType.italic:
          fontStyle = FontStyle.italic;
          break;
        case TextType.underlined:
          decorations.add(TextDecoration.underline);
          break;
      }
    }
    return TextSpan(
        text: this.text,
        recognizer: recognizer,
        style: TextStyle(
            fontStyle: fontStyle,
            fontWeight: fontWeight,
            color: color,
            decoration: TextDecoration.combine(decorations)));
  }
}
