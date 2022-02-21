import 'package:chat_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    appBarTheme:
        AppBarTheme(backgroundColor: Theme.of(context).scaffoldBackgroundColor),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.kContentColorLightTheme,
    iconTheme: const IconThemeData(color: AppColors.kContentColorLightTheme),
    brightness: Brightness.light,
    dividerColor: Colors.black,
    textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Inter'),
    primaryTextTheme: ThemeData.light().textTheme.apply(fontFamily: 'Inter'),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      error: AppColors.errorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: AppColors.kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: AppColors.primaryColor),
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
        focusColor: Colors.black,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        )),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.grey,
    ),
  );
}

//===============================================================
ThemeData darkTheme(BuildContext context) {
  return ThemeData.dark().copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.primaryColor),
    brightness: Brightness.dark,
    dividerColor: Colors.white,
    textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Inter'),
    primaryTextTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Inter'),
    colorScheme:
        Theme.of(context).colorScheme.copyWith(primary: Colors.deepPurple),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.grey,
    ),
    inputDecorationTheme: const InputDecorationTheme(
        focusColor: Colors.black,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        )),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
    ),
  );
}
