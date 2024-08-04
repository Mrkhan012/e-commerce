import 'package:flutter/material.dart';

// Import your custom color and theme definitions

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [newTheme].
  void changeTheme(String newTheme) {
    _appTheme = newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found. Make sure you have added this theme class in JSON. Try running flutter pub run build_runner");
    }
    //return theme from map
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found. Make sure you have added this theme class in JSON. Try running flutter pub run build_runner");
    }
    //return theme from map
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray100,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.indigo900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.indigo900,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 11,
        space: 11,
        color: appTheme.blueGray30001,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 16,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 8,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w400,
        ),
        labelMedium: TextStyle(
          color: appTheme.indigo900,
          fontSize: 12,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: appTheme.indigo900,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.gray400,
          fontSize: 12,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: appTheme.indigo900,
          fontSize: 14,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 16,
          fontFamily: "Lexend",
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontFamily: ' Lexend',
          fontWeight: FontWeight.w400,
          color: appTheme.blueGray30001,
        ),
        headlineLarge: const TextStyle(
          fontSize: 14,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 4, 34, 58),
        ),
        headlineMedium: const TextStyle(
          fontSize: 10,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w400,
          color: appTheme.lightBlueA400,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light();
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber700 => const Color(0XFFF7A301);
  Color get amberA400 => const Color(0XFFFFC000);

  // BlueGray
  Color get blueGray300 => const Color(0XFF919CAE);
  Color get blueGray30001 => const Color(0XFF949AA8);
  Color get blueGray90005 => const Color(0X05222259);

  // Gray
  Color get gray100 => const Color(0XFFF4F4F6);
  Color get gray200 => const Color(0XFFE8EAED);
  Color get gray80075 => const Color(0X75393D46);
  Color get gray90019 => const Color(0X190F1933);

  // Indigo
  Color get indigo100 => const Color(0XFFC3CFEE);
  Color get indigo900 => const Color(0XFF1E336A);

  // LightBlue
  Color get lightBlueA400 => const Color(0XFF00BBF2);

  // Red
  Color get red700 => const Color(0XFFED1B24);

  // White
  Color get whiteA700 => const Color(0XFFFFFFFF);

  // Amber
  Color get gray400 => const Color(0XFFF4F4F6);

  // Gray
  Color get gray9000a => const Color(0X0A0F1933);

  // LightGreen
  Color get lightGreenA700 => const Color(0XFF38C006);

  // BlueGray
  Color get blueGray100 => const Color(0XFFD5D7DD);
  Color get blueGray200 => const Color(0XFFABAFBA);
  Color get fillWhiteA => const Color(0XFFFFFFFF);
}

// Use these getter methods to access theme and colors
PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
