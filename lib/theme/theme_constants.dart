import 'package:flutter/material.dart';

// Colors
const fontColorDark = Color.fromRGBO(64, 65, 65, 1);
const fontColorLight = Color.fromRGBO(99, 98, 99, 1);
const fontColorBlue = Color.fromRGBO(73, 111, 229, 1);

const fontColorLightWhite = Color.fromRGBO(243, 236, 253, 1);
const fontColorLightWhite2 = Color.fromRGBO(245, 247, 255, 1);

const fontColorPureWhite = Color.fromARGB(255, 255, 255, 255);

const linearGradientBlue = LinearGradient(
  begin: Alignment.center,
  end: Alignment(0.8, 1),
  colors: <Color>[
    Color.fromRGBO(37, 121, 216, 1),
    Color.fromRGBO(106, 169, 239, 1),
  ],
  tileMode: TileMode.mirror,
);

const linearGradientViolet = LinearGradient(
  begin: Alignment.center,
  end: Alignment(0.8, 1),
  colors: <Color>[
    Color.fromRGBO(45, 135, 238, 1),
    Color.fromRGBO(139, 71, 252, 1),
  ],
  tileMode: TileMode.mirror,
);

// Font Sizes
const fontSizeHeading1 = 22.0;
const fontSizeHeading2 = 18.0;

const fontSizeContent1 = 16.0;
const fontSizeContent2 = 14.0;
