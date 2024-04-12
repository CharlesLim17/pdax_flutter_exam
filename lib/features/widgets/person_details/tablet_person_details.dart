import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabletPersonDetails extends ConsumerWidget {
  const TabletPersonDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        'Tablet Person Details',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
