import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobilePersonDetails extends ConsumerWidget {
  const MobilePersonDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        'Mobile Person Details',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
