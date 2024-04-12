import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabletPersonList extends ConsumerWidget {
  const TabletPersonList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        'Tablet Person List',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
