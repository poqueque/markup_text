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
    Color cColor;
    TapGestureRecognizer recognizer;
    List<TextDecoration> decorations = [];
    FontWeight fontWeight = FontWeight.normal;
    FontStyle fontStyle = FontStyle.normal;
    for (TextType type in types) {
      switch (type) {
        case TextType.link:
          cColor = Colors.blue;
          decorations.add(TextDecoration.underline);
          if (url != null)
            recognizer = TapGestureRecognizer()
              ..onTap = () async {
                if (await canLaunch(url)) launch(url);
              };
          break;
        case TextType.color:
          if (color.startsWith("#"))
            cColor = hexToColor(color);
          else
            cColor = nameToColor(color);
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
            color: cColor,
            decoration: TextDecoration.combine(decorations)));
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1), radix: 16) + 0xFF000000);
  }

  // cat ~/dev/flutter/flutter/packages/flutter/lib/src/material/colors.dart | grep "static const" | grep -v _ | cut -f6 -d" " | awk '{print "case \"" $1 "\": return Colors." $1 ";"}'
  Color nameToColor(String name) {
    switch (name) {
      case "transparent":
        return Colors.transparent;
      case "black":
        return Colors.black;
      case "black87":
        return Colors.black87;
      case "black54":
        return Colors.black54;
      case "black45":
        return Colors.black45;
      case "black38":
        return Colors.black38;
      case "black26":
        return Colors.black26;
      case "black12":
        return Colors.black12;
      case "white":
        return Colors.white;
      case "white70":
        return Colors.white70;
      case "white60":
        return Colors.white60;
      case "white54":
        return Colors.white54;
      case "white38":
        return Colors.white38;
      case "white30":
        return Colors.white30;
      case "white24":
        return Colors.white24;
      case "white12":
        return Colors.white12;
      case "white10":
        return Colors.white10;
      case "red":
        return Colors.red;
      case "redAccent":
        return Colors.redAccent;
      case "pink":
        return Colors.pink;
      case "pinkAccent":
        return Colors.pinkAccent;
      case "purple":
        return Colors.purple;
      case "purpleAccent":
        return Colors.purpleAccent;
      case "deepPurple":
        return Colors.deepPurple;
      case "deepPurpleAccent":
        return Colors.deepPurpleAccent;
      case "indigo":
        return Colors.indigo;
      case "indigoAccent":
        return Colors.indigoAccent;
      case "blue":
        return Colors.blue;
      case "blueAccent":
        return Colors.blueAccent;
      case "lightBlue":
        return Colors.lightBlue;
      case "lightBlueAccent":
        return Colors.lightBlueAccent;
      case "cyan":
        return Colors.cyan;
      case "cyanAccent":
        return Colors.cyanAccent;
      case "teal":
        return Colors.teal;
      case "tealAccent":
        return Colors.tealAccent;
      case "green":
        return Colors.green;
      case "greenAccent":
        return Colors.greenAccent;
      case "lightGreen":
        return Colors.lightGreen;
      case "lightGreenAccent":
        return Colors.lightGreenAccent;
      case "lime":
        return Colors.lime;
      case "limeAccent":
        return Colors.limeAccent;
      case "yellow":
        return Colors.yellow;
      case "yellowAccent":
        return Colors.yellowAccent;
      case "amber":
        return Colors.amber;
      case "amberAccent":
        return Colors.amberAccent;
      case "orange":
        return Colors.orange;
      case "orangeAccent":
        return Colors.orangeAccent;
      case "deepOrange":
        return Colors.deepOrange;
      case "deepOrangeAccent":
        return Colors.deepOrangeAccent;
      case "brown":
        return Colors.brown;
      case "grey":
        return Colors.grey;
      case "blueGrey":
        return Colors.blueGrey;
    }
    return null;
  }
}
