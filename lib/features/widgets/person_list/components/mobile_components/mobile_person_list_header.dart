import 'package:flutter/material.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as constants;

class MobilePersonListHeader extends StatelessWidget {
  const MobilePersonListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Person List',
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: constants.mainText,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
    );
  }
}
