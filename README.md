# markup_text

![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)

Flutter widget to use Markup to easily create formatted Text.

**Please star the repo to support the project**

### Resources:
- [Pub Package](https://pub.dev/packages/markup_text)
- [GitHub Repository](https://github.com/poqueque/markup_text)

## Contents
c
- [Usage](#usage)

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
            " a second link containing a word in (i)italics(/i)(/a) and (c #ff0000)coloured(/c) words"
            " (c deepPurpleAccent)here(/c) and (c black87)there(/c).",
            style: TextStyle(fontSize: 18),
          ),
```
![](.README_images/ba32bfa9.png | width=300)

### Markup language

The following tags are recognized by the widget

#### (b)Bold(/b)

```dart
MarkupText("This is a (b)bold(/b) text")
```

#### (i)Italic(/i)

```dart
MarkupText("This is an (i)italic(/i) text")
```

#### (u)Underlined(/u)

```dart
MarkupText("This is an (u)underlined(/u) text")
```

#### (a http://example.com)Links(/a)

```dart
MarkupText("(a http://example.com)This is a link(/a)")
```
#### (c color)Colors(/c)

```dart
MarkupText("(c #ff0000)Colors from RGB codes(/c)")
```
```dart
MarkupText("(c amber)You can also use named colors(/c)")
```

The tag (c) uses either a color code started with `#` or a named color. Valid names are the ones defined on the Flutter class Colors:

| Color Name | Color |
| ------------- | ------------- |
| amber | ![](https://via.placeholder.com/15/FFC107/000000?text=+) |
| amberAccent | ![](https://via.placeholder.com/15/FFD740/000000?text=+) |
| black | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| black12 | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| black26 | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| black38 | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| black45 | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| black54 | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| black87 | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| blue | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| blueAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| blueGrey | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| brown | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| cyan | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| cyanAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| deepOrange | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| deepOrangeAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| deepPurple | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| deepPurpleAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| green | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| greenAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| grey | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| indigo | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| indigoAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| lightBlue | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| lightBlueAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| lightGreen | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| lightGreenAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| lime | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| limeAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| orange | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| orangeAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| pink | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| pinkAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| primaries | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| purple | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| purpleAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| red | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| redAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| teal | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| tealAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| transparent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| white | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| white10 | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| white12 | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| white24 | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| white30 | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| white38 | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| white54 | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| white60 | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| white70 | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| yellow | ![](https://via.placeholder.com/15/f03c15/000000?text=+) |
| yellowAccent | ![](https://via.placeholder.com/15/f03c15/000000?text=+) | 