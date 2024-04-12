import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DesktopPersonDetails extends ConsumerWidget {
  const DesktopPersonDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        'Desktop Person Details',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
