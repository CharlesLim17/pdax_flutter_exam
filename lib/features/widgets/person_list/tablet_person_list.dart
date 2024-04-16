import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/features/controllers/person_controller.dart';
import 'package:pdax_flutter_exam/features/providers/person_list_provider/person_list_provider.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as constants;
import 'package:pdax_flutter_exam/features/widgets/person_list/components/tablet_components/tablet_person_list_header.dart';
import 'package:pdax_flutter_exam/features/widgets/person_list/components/tablet_components/tablet_person_list_view.dart';
import 'package:pdax_flutter_exam/global/empty_screens/tablet_not_found.dart';
import 'package:pdax_flutter_exam/global/shimmers/tablet_shimmer.dart';

class TabletPersonList extends ConsumerWidget {
  const TabletPersonList({super.key});

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
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            children: [
              //
              const SizedBox(height: 64),

              // =================== Header Text =================== //
              const TabletPersonListHeader(),

              //
              const SizedBox(height: 32),

              // =================== Person List =================== //
              isFirstFetched
                  ? Expanded(
                      child: SingleChildScrollView(
                        child: buildTabletLoadingSkeleton(),
                      ),
                    )
                  : personList.isEmpty
                      ? const TabletNotFoundWidget()
                      : Expanded(
                          child: TabletPersonListView(
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
