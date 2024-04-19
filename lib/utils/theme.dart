import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

Color lightgreenshede = Color(0xFFF0FAF6);
Color gray100 = Color.fromRGBO(248, 248, 248, 1);
Color skinFill = Color.fromRGBO(244, 117, 33, 1);
Color lightPrimary = const Color(0xfff3f4f9);
Color darkPrimary = const Color(0xff2B2B2B);
Color lightAccent = const Color(0xff886EE4);
Color darkAccent = const Color(0xff886EE4);
Color lightBG = const Color(0xfff3f4f9);
Color darkBG = const Color(0xff2B2B2B);
Color green = const Color(0xff33C759);
Color greenDark = const Color(0xff1B8D39);
Color red = const Color(0xffFF2D4D);
Color redDark = const Color(0xff980017);
Color primaryThemeColor = Color(0xFF3141B2);
Color lightBlueIcons = Color(0xFFF1F2FC);
Color headerColor = Color(0xFFE3EFFF);
Color greyColor1 = Color(0xFFF4F4F4);
Color greyColor2 = Color(0xFFC4C4C4);
Color greyColor3 = Color(0xFFBEBAB3);
Color greyColor4 = const Color(0xFF999999);
Color greyColor5 = Color(0xFF666666);
Color greyColor10 = Color(0xFF343434);
Color greenLight = Color(0xFF05FF00);
Color pinkLight = Color(0xFFFB2323);

double heigth = 926.h;
double width = 428.w;

const kAnimationDuration = Duration(milliseconds: 200);

class FindTheme {
  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'WorkSans';
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(fontFamily: fontName),
      displayMedium: base.displayMedium?.copyWith(fontFamily: fontName),
      displaySmall: base.displaySmall?.copyWith(fontFamily: fontName),
      headlineMedium: base.headlineMedium?.copyWith(fontFamily: fontName),
      headlineSmall: base.headlineSmall?.copyWith(fontFamily: fontName),
      titleLarge: base.titleLarge?.copyWith(fontFamily: fontName),
      labelLarge: base.labelLarge?.copyWith(fontFamily: fontName),
      bodySmall: base.bodySmall?.copyWith(fontFamily: fontName),
      bodyLarge: base.bodyLarge?.copyWith(fontFamily: fontName),
      bodyMedium: base.bodyMedium?.copyWith(fontFamily: fontName),
      titleMedium: base.titleMedium?.copyWith(fontFamily: fontName),
      titleSmall: base.titleSmall?.copyWith(fontFamily: fontName),
      labelSmall: base.labelSmall?.copyWith(fontFamily: fontName),
    );
  }

  static ThemeData buildLightTheme() {
    const Color primaryColor = Color(0xFF54D3C2);
    const Color secondaryColor = Color(0xFF54D3C2);
    Color findSkinFill = Color.fromRGBO(244, 117, 33, 1);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: findSkinFill,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      platform: TargetPlatform.iOS,
      colorScheme: colorScheme
          .copyWith(background: const Color(0xFFFFFFFF))
          .copyWith(error: const Color(0xFFB00020)),
    );
  }

  static const lightThemeFont = "ComicNeue", darkThemeFont = "Poppins";
  // light theme
  static final lightTheme = ThemeData(
    primaryColor: lightThemeColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: white,
    useMaterial3: true,
    fontFamily: lightThemeFont,
    switchTheme: SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith<Color>((states) => lightThemeColor),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: white,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: black,
        fontSize: 23, //20
      ),
      iconTheme: IconThemeData(color: lightThemeColor),
      elevation: 0,
      actionsIconTheme: IconThemeData(color: lightThemeColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );

  // dark theme
  static final darkTheme = ThemeData(
    primaryColor: darkThemeColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: black,
    useMaterial3: true,
    fontFamily: darkThemeFont,
    backgroundColor: Colors.grey.shade700,
    switchTheme: SwitchThemeData(
      trackColor:
          MaterialStateProperty.resolveWith<Color>((states) => darkThemeColor),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: black,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: white,
        fontSize: 23, //20
      ),
      iconTheme: IconThemeData(color: darkThemeColor),
      elevation: 0,
      actionsIconTheme: IconThemeData(color: darkThemeColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: black,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );

  // colors
  static Color lightThemeColor = skinFill,
      white = Colors.white,
      black = Colors.black,
      darkThemeColor = skinFill;
}

class ThemeDarkBackground {
  static Color getBackgroundColor(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? Colors.grey[900]! : Colors.white;
  }

  static Color getTextColor(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? Colors.grey.shade100
        : Colors.grey.shade900;
  }
}
