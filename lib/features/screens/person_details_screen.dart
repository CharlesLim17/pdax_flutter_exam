import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/config/provider/dimensions_provider.dart';
import 'package:pdax_flutter_exam/features/widgets/person_details/desktop_person_details.dart';
import 'package:pdax_flutter_exam/features/widgets/person_details/mobile_person_details.dart';
import 'package:pdax_flutter_exam/features/widgets/person_details/tablet_person_details.dart';

class PersonDetailsScreen extends ConsumerWidget {
  const PersonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dimension = ref.watch(dimensionControllerProvider);

    if (dimension is DimensionMobile) {
      return const MobilePersonDetails();
    }

    if (dimension is DimensionTablet) {
      return const TabletPersonDetails();
    }

    if (dimension is DimensionDesktop) {
      return const DesktopPersonDetails();
    }

    return const DesktopPersonDetails();
  }
}
