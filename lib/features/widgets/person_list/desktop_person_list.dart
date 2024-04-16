import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/features/controllers/person_controller.dart';
import 'package:pdax_flutter_exam/features/providers/person_list_provider/person_list_provider.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as constants;
import 'package:pdax_flutter_exam/features/widgets/person_list/components/desktop_components/desktop_person_list_header.dart';
import 'package:pdax_flutter_exam/features/widgets/person_list/components/desktop_components/desktop_person_list_view.dart';
import 'package:pdax_flutter_exam/global/empty_screens/desktop_not_found.dart';
import 'package:pdax_flutter_exam/global/shimmers/custom_shimmer.dart';

class DesktopPersonList extends ConsumerWidget {
  const DesktopPersonList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personList = ref.watch(personListProvider);
    final isFirstFetched = ref.watch(isPersonFirstFetchProvider);
    final appendCount = ref.watch(listAppendCountProvider);

    Future.delayed(Duration.zero, () async {
      // Fetch first data on the list Then set isFirstFethed to true
      if (isFirstFetched) {
        await ref.read(personListControllerProvider.notifier).fetchPersonList();
        await ref.read(isPersonFirstFetchProvider.notifier).setValue(false);
      }
    });

    //
    return Scaffold(
      // =================== Scaffold Styles =================== //
      backgroundColor: constants.background,

      // =================== Scaffold Body =================== //
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            children: [
              //
              const SizedBox(height: 64),

              // =================== Header Text =================== //
              const DesktopPersonListHeader(),

              //
              const SizedBox(height: 32),

              // =================== Person List =================== //
              isFirstFetched
                  ? Expanded(
                      child: SingleChildScrollView(
                        child: buildLoadingSkeleton(),
                      ),
                    )
                  : personList.isEmpty
                      ? const DesktopNotFoundWidget()
                      : Expanded(
                          child: DesktopPersonListView(
                            personList: personList,
                            appendCount: appendCount,
                          ),
                        ),

              //
              const SizedBox(height: 32),

              //
            ],
          ),
        ),
      ),
    );
  }
}
