import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as constants;

class TabletNotFoundWidget extends StatelessWidget {
  const TabletNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          const SizedBox(height: 64),

          // SVG
          SizedBox(
            width: 300,
            height: 250,
            child: SvgPicture.asset(
              'assets/svgs/pdax_not_found.svg',
              fit: BoxFit.cover,
            ),
          ),

          //
          const SizedBox(height: 24),

          // Text
          Text(
            'No Persons Found',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: constants.primary,
                ),
          ),

          //
          const SizedBox(height: 14),

          // Sub Text
          Text(
            'There are currently no persons in the list, try again later or refresh the page.',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 14,
                  color: constants.mainText,
                ),
            textAlign: TextAlign.center,
          ),

          //
          const SizedBox(height: 18),

          // Thank you
          Text(
            'Thank you for your patience',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: constants.mainText,
                ),
          ),
        ],
      ),
    );
  }
}
