import 'package:flutter/material.dart';

class AppTheme {
  // constuctor
  const AppTheme({required this.context});

  final BuildContext context;

  // Theme Data
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        inputDecorationTheme: _inputDecoration,
        textTheme: _textTheme,
      );

  // ================= Input Decoration Theme ================= //
  InputDecorationTheme get _inputDecoration => InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF3F3F3),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2.5,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      );

  // ================= Costumize Text Style ================= //
  TextTheme get _textTheme => const TextTheme(
        // ================= Headings ================= //
        headlineLarge: TextStyle(
          fontFamily: 'Poppins-Regular',
        ),

        headlineMedium: TextStyle(
          fontFamily: 'Poppins-Regular',
        ),

        headlineSmall: TextStyle(
          fontFamily: 'Poppins-Regular',
        ),

        // ================= Titles ================= //
        titleLarge: TextStyle(
          fontFamily: 'Poppins-SemiBold',
        ),

        titleMedium: TextStyle(
          fontFamily: 'Poppins-SemiBold',
        ),

        titleSmall: TextStyle(
          fontFamily: 'Poppins-SemiBold',
        ),

        // ================= Bodies ================= //
        bodyLarge: TextStyle(
          fontFamily: 'Poppins-SemiBold',
        ),

        bodyMedium: TextStyle(
          fontFamily: 'Poppins-SemiBold',
        ),

        bodySmall: TextStyle(
          fontFamily: 'Poppins-SemiBold',
        ),

        // ================= Labels ================= //
        labelLarge: TextStyle(
          fontFamily: 'Poppins-Regular',
        ),

        labelMedium: TextStyle(
          fontFamily: 'Poppins-Regular',
        ),

        labelSmall: TextStyle(
          fontFamily: 'Poppins-Regular',
        ),
      );
}
