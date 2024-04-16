import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

showSnackBar(
  BuildContext context,
  String message,
  Color color,
  Color textColor,
) async {
  //

  return AnimatedSnackBar(
    duration: const Duration(milliseconds: 2000),
    builder: ((context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        margin: const EdgeInsets.only(top: 24),
        child: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: textColor),
        ),
      );
    }),
  ).show(context);
}
