import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor appColor = const MaterialColor(
    0xff61334e, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffB099A6), //10%
      100: const Color(0xffA08494), //20%
      200: const Color(0xff907083), //30%
      300: const Color(0xff805B71), //40%
      400: const Color(0xff70475F), //50%
      500: const Color(0xff572D46), //60%
      600: const Color(0xff4D283E), //70%
      700: const Color(0xff432336), //80%
      800: const Color(0xff3A1E2E), //90%
      900: const Color(0xff301927), //100%
    },
  );
  static const MaterialColor appColorAccent = const MaterialColor(
    0xff2a2944, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff9494A1), //10%
      100: const Color(0xff7F7E8E), //20%
      200: const Color(0xff69697C), //30%
      300: const Color(0xff545369), //40%
      400: const Color(0xff3F3E56), //50%
      500: const Color(0xff2a2944), //60%
      600: const Color(0xff25243D), //70%
      700: const Color(0xff212036), //80%
      800: const Color(0xff1D1C2F), //90%
      900: const Color(0xff191828), //100%
    },
  );
}
