import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DesktopPersonList extends ConsumerWidget {
  const DesktopPersonList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        'Desktop Person List',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
