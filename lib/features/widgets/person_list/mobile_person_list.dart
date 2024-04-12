import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobilePersonList extends ConsumerWidget {
  const MobilePersonList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        'Mobile Person List',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
