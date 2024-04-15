import 'package:flutter/material.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as color_constants;

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.ctrlr,
    required this.enabled,
    required this.hint,
  });

  final TextEditingController ctrlr;
  final bool enabled;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrlr,
      enabled: enabled,

      // Input Text Styles
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: color_constants.mainText,
            fontSize: 16,
          ),

      // Decorations
      decoration: InputDecoration(
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: color_constants.primary),
        ),
        // border: OutlineInputBorder(
        //   // borderSide: BorderSide
        //   borderSide: const BorderSide(color: color_constants.primary),
        //   borderRadius: BorderRadius.circular(12),
        // ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 12),

        // hint
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: color_constants.subText,
              fontSize: 16,
            ),
      ),
    );
  }
}
