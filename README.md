# markup_text

![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)
[![Version](https://img.shields.io/pub/v/markup_text.svg)](https://pub.dev/packages/markup_text)

Flutter widget to use Markup to easily create formatted Text.

**Please star the repo to support the project**

### Resources:
- [Pub Package](https://pub.dev/packages/markup_text)
- [GitHub Repository](https://github.com/poqueque/markup_text)

## Usage

`MarkupText` is a wrapper for `RichText` that simplifies the creation of text with mixed styles.

```dart
MarkupText("This is a (b)Markup(/b) example with (c deepPurple)a purple text(/c)")
```

### style

The `style` parameter works as with the `Text` widget. Styles defined will merge with default Style for Text.

```dart
  MarkupText(
    "This is a (b)bold(/b) text (a http://flutter.dev)with a link(/a),"
    " an (u)underlined(/u) word (a http://pub.dev)with"
    " a second link containing a word in (i)italics(/i)(/a) and (c #ff0000)colored(/c) words"
    " (c deepPurpleAccent)here(/c) and (c green)there(/c).",
    style: TextStyle(fontSize: 18),
  ),

  MarkupText(
    "(c purple)(icon flight_takeoff) Departures(/c)\n"
    "(c teal)(icon flight_land) Arrivals(/c)",
    style: TextStyle(fontSize: 18),
  ),
```

![](.README_images/95c88bfa.png)

### Markup language

The following tags are recognized by the widget

#### Bold

Use tag (b)..(/b) for bold text

```dart
MarkupText("This is a (b)bold(/b) text")
```

#### Italic

Use tag (i)..(/i) for italic text

```dart
MarkupText("This is an (i)italic(/i) text")
```

#### Underlined

Use tag (u)..(/u) for underlined text

```dart
MarkupText("This is an (u)underlined(/u) text")
```

#### Links

Use tag (a \<url\>)..(/a) to create links

```dart
MarkupText("(a http://example.com)This is a link(/a)")
```
#### Colors

Use tag (c \<color\>)..(/c) to create colored text

```dart
MarkupText("(c #ff0000)Colors from RGB codes(/c)")
```
```dart
MarkupText("(c amber)You can also use named colors(/c)")
```
You can use all the colors included in the [Material `Colors` class from Flutter](https://api.flutter.dev/flutter/material/Colors-class.html#constants).
You can check the full list [below](#Colors list).

#### Icons

Use tag (icon \<icon name\>) to insert an icon. The icon will be colored when affected by a color tag.

```dart
MarkupText("(c red)(icon error) An error has occurred(/c)")
```

You can use all the icons included in the [Material `Icons` class from Flutter](https://api.flutter.dev/flutter/material/Icons-class.html#constants).


## Colors list

\<color\> can be either a RGB color code started with `#` or a named color. Valid names are the ones defined on the Flutter class Colors:

| Color Name | Color |
| ------------- | :-----------: |
| amber | ![](https://via.placeholder.com/15/FFC107/000000?text=+) |
| amberAccent | ![](https://via.placeholder.com/15/FFD740/000000?text=+) |
| black | ![](https://via.placeholder.com/15/000000/000000?text=+) |
| black12 | ![](https://via.placeholder.com/15/e0e0e0/000000?text=+) |
| black26 | ![](https://via.placeholder.com/15/bdbdbd/000000?text=+) |
| black38 | ![](https://via.placeholder.com/15/9c9c9c/000000?text=+) |
| black45 | ![](https://via.placeholder.com/15/8c8c8c/000000?text=+) |
| black54 | ![](https://via.placeholder.com/15/757575/000000?text=+) |
| black87 | ![](https://via.placeholder.com/15/222222/000000?text=+) |
| blue | ![](https://via.placeholder.com/15/2196f3/000000?text=+) |
| blueAccent | ![](https://via.placeholder.com/15/448aff/000000?text=+) |
| blueGrey | ![](https://via.placeholder.com/15/607d8b/000000?text=+) |
| brown | ![](https://via.placeholder.com/15/795548/000000?text=+) |
| cyan | ![](https://via.placeholder.com/15/00bcd4/000000?text=+) |
| cyanAccent | ![](https://via.placeholder.com/15/18ffff/000000?text=+) |
| deepOrange | ![](https://via.placeholder.com/15/ff5722/000000?text=+) |
| deepOrangeAccent | ![](https://via.placeholder.com/15/ff6e40/000000?text=+) |
| deepPurple | ![](https://via.placeholder.com/15/673ab7/000000?text=+) |
| deepPurpleAccent | ![](https://via.placeholder.com/15/7c4dff/000000?text=+) |
| green | ![](https://via.placeholder.com/15/4caf50/000000?text=+) |
| greenAccent | ![](https://via.placeholder.com/15/69f0ae/000000?text=+) |
| grey | ![](https://via.placeholder.com/15/9e9e9e/000000?text=+) |
| indigo | ![](https://via.placeholder.com/15/3f51b5/000000?text=+) |
| indigoAccent | ![](https://via.placeholder.com/15/536dfe/000000?text=+) |
| lightBlue | ![](https://via.placeholder.com/15/03a9f4/000000?text=+) |
| lightBlueAccent | ![](https://via.placeholder.com/15/40c4ff/000000?text=+) |
| lightGreen | ![](https://via.placeholder.com/15/8bc34a/000000?text=+) |
| lightGreenAccent | ![](https://via.placeholder.com/15/b2ff59/000000?text=+) |
| lime | ![](https://via.placeholder.com/15/cddc39/000000?text=+) |
| limeAccent | ![](https://via.placeholder.com/15/eeff41/000000?text=+) |
| orange | ![](https://via.placeholder.com/15/ff9800/000000?text=+) |
| orangeAccent | ![](https://via.placeholder.com/15/ffab40/000000?text=+) |
| pink | ![](https://via.placeholder.com/15/e91e63/000000?text=+) |
| pinkAccent | ![](https://via.placeholder.com/15/ff4081/000000?text=+) |
| purple | ![](https://via.placeholder.com/15/9c27b0/000000?text=+) |
| purpleAccent | ![](https://via.placeholder.com/15/e040fb/000000?text=+) |
| red | ![](https://via.placeholder.com/15/f44336/000000?text=+) |
| redAccent | ![](https://via.placeholder.com/15/ff5252/000000?text=+) |
| teal | ![](https://via.placeholder.com/15/009688/000000?text=+) |
| tealAccent | ![](https://via.placeholder.com/15/64ffda/000000?text=+) |
| transparent |  |
| white | ![](https://via.placeholder.com/15/ffffff/000000?text=+) |
| white10 | ![](https://via.placeholder.com/15/1a1a1a/000000?text=+) |
| white12 | ![](https://via.placeholder.com/15/1f1f1f/000000?text=+) |
| white24 | ![](https://via.placeholder.com/15/3d3d3d/000000?text=+) |
| white30 | ![](https://via.placeholder.com/15/4d4d4d/000000?text=+) |
| white38 | ![](https://via.placeholder.com/15/626262/000000?text=+) |
| white54 | ![](https://via.placeholder.com/15/8a8a8a/000000?text=+) |
| white60 | ![](https://via.placeholder.com/15/999999/000000?text=+) |
| white70 | ![](https://via.placeholder.com/15/b3b3b3/000000?text=+) |
| yellow | ![](https://via.placeholder.com/15/ffeb3b/000000?text=+) |
| yellowAccent | ![](https://via.placeholder.com/15/ffff00/000000?text=+) | 