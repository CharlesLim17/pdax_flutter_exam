import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/features/controllers/person_controller.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as constants;
import 'package:pdax_flutter_exam/features/providers/person_list_provider/person_list_provider.dart';
import 'package:pdax_flutter_exam/features/widgets/person_list/components/mobile_components/mobile_person_list_header.dart';
import 'package:pdax_flutter_exam/features/widgets/person_list/components/mobile_components/mobile_person_list_view.dart';
import 'package:pdax_flutter_exam/global/empty_screens/mobile_not_found.dart';
import 'package:pdax_flutter_exam/global/shimmers/custom_shimmer.dart';

class MobilePersonList extends ConsumerStatefulWidget {
  const MobilePersonList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MobilePersonListState();
}

class _MobilePersonListState extends ConsumerState<MobilePersonList> {
  final scrollController = ScrollController();
  int appendCount = 1;

  // init state
  @override
  void initState() {
    super.initState();

    // Scroll Listener for fetching more data
    scrollController.addListener(() async {
      if (appendCount != 4) {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          // Fetch More Data once scroll position at max
          await ref
              .read(personListControllerProvider.notifier)
              .fetchPersonList();

          // Increment to the append counter
          setState(() {
            appendCount += 1;
          });
        }
      }
    });
  }

  // dispose
  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  // build
  @override
  Widget build(BuildContext context) {
    final personList = ref.watch(personListProvider);
    final isFirstFetched = ref.watch(isPersonFirstFetchProvider);

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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RefreshIndicator(
            onRefresh: () async {
              setState(() {
                appendCount = 1;
              });
              await ref.read(listQuantityProvider.notifier).setValue(10);
              ref.invalidate(personListProvider);
              ref.invalidate(isPersonFirstFetchProvider);

              await ref
                  .read(personListControllerProvider.notifier)
                  .fetchPersonList();
              await ref
                  .read(isPersonFirstFetchProvider.notifier)
                  .setValue(false);
            },
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  const SizedBox(height: 32),

                  // =================== Header Text =================== //
                  const MobilePersonListHeader(),

                  const SizedBox(height: 16),

                  // =================== Person List =================== //
                  isFirstFetched
                      ? buildLoadingSkeleton()
                      : personList.isEmpty
                          ? const MobileNotFoundWidget()
                          : MobilePersonListView(
                              personList: personList,
                              appendCount: appendCount,
                            )

                  //
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
