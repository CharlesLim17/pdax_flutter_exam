import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/config/provider/dimensions_provider.dart';
import 'package:pdax_flutter_exam/features/widgets/person_list/desktop_person_list.dart';
import 'package:pdax_flutter_exam/features/widgets/person_list/mobile_person_list.dart';
import 'package:pdax_flutter_exam/features/widgets/person_list/tablet_person_list.dart';

class PersonListScreen extends ConsumerWidget {
  const PersonListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dimension = ref.watch(dimensionControllerProvider);

    if (dimension is DimensionMobile) {
      return const MobilePersonList();
    }

    if (dimension is DimensionTablet) {
      return const TabletPersonList();
    }

    if (dimension is DimensionDesktop) {
      return const DesktopPersonList();
    }

    return const DesktopPersonList();
  }
}
