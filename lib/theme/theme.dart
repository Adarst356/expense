import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff156683),
      surfaceTint: Color(0xff156683),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbfe9ff),
      onPrimaryContainer: Color(0xff004d65),
      secondary: Color(0xff4d616c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd0e6f3),
      onSecondaryContainer: Color(0xff364954),
      tertiary: Color(0xff5e5a7d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffe4dfff),
      onTertiaryContainer: Color(0xff464364),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff171c1f),
      onSurfaceVariant: Color(0xff40484c),
      outline: Color(0xff70787d),
      outlineVariant: Color(0xffc0c8cd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3134),
      inversePrimary: Color(0xff8ccff0),
      primaryFixed: Color(0xffbfe9ff),
      onPrimaryFixed: Color(0xff001f2a),
      primaryFixedDim: Color(0xff8ccff0),
      onPrimaryFixedVariant: Color(0xff004d65),
      secondaryFixed: Color(0xffd0e6f3),
      onSecondaryFixed: Color(0xff081e27),
      secondaryFixedDim: Color(0xffb4cad6),
      onSecondaryFixedVariant: Color(0xff364954),
      tertiaryFixed: Color(0xffe4dfff),
      onTertiaryFixed: Color(0xff1a1836),
      tertiaryFixedDim: Color(0xffc7c2ea),
      onTertiaryFixedVariant: Color(0xff464364),
      surfaceDim: Color(0xffd6dade),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f8),
      surfaceContainer: Color(0xffeaeef2),
      surfaceContainerHigh: Color(0xffe4e9ec),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }


  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff8ccff0),
      surfaceTint: Color(0xff8ccff0),
      onPrimary: Color(0xff003547),
      primaryContainer: Color(0xff004d65),
      onPrimaryContainer: Color(0xffbfe9ff),
      secondary: Color(0xffb4cad6),
      onSecondary: Color(0xff1f333d),
      secondaryContainer: Color(0xff364954),
      onSecondaryContainer: Color(0xffd0e6f3),
      tertiary: Color(0xffc7c2ea),
      onTertiary: Color(0xff2f2d4c),
      tertiaryContainer: Color(0xff464364),
      onTertiaryContainer: Color(0xffe4dfff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1417),
      onSurface: Color(0xffdfe3e7),
      onSurfaceVariant: Color(0xffc0c8cd),
      outline: Color(0xff8a9297),
      outlineVariant: Color(0xff40484c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inversePrimary: Color(0xff156683),
      primaryFixed: Color(0xffbfe9ff),
      onPrimaryFixed: Color(0xff001f2a),
      primaryFixedDim: Color(0xff8ccff0),
      onPrimaryFixedVariant: Color(0xff004d65),
      secondaryFixed: Color(0xffd0e6f3),
      onSecondaryFixed: Color(0xff081e27),
      secondaryFixedDim: Color(0xffb4cad6),
      onSecondaryFixedVariant: Color(0xff364954),
      tertiaryFixed: Color(0xffe4dfff),
      onTertiaryFixed: Color(0xff1a1836),
      tertiaryFixedDim: Color(0xffc7c2ea),
      onTertiaryFixedVariant: Color(0xff464364),
      surfaceDim: Color(0xff0f1417),
      surfaceBright: Color(0xff353a3d),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff171c1f),
      surfaceContainer: Color(0xff1b2023),
      surfaceContainerHigh: Color(0xff262b2e),
      surfaceContainerHighest: Color(0xff303538),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }


  ThemeData theme(ColorScheme colorScheme) =>
      ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );


}