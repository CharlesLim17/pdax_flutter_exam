import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as constants;
import 'package:pdax_flutter_exam/features/controllers/person_controller.dart';
import 'package:pdax_flutter_exam/features/models/person_model.dart';
import 'package:pdax_flutter_exam/features/providers/person_details_provider/person_details_provider.dart';
import 'package:pdax_flutter_exam/features/providers/person_list_provider/person_list_provider.dart';

class DesktopPersonListView extends ConsumerWidget {
  const DesktopPersonListView({
    super.key,
    required this.personList,
    required this.appendCount,
  });

  final List<Datum> personList;
  final int appendCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appendCount = ref.watch(listAppendCountProvider);

    //
    return SingleChildScrollView(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: personList.length + 1,
        itemBuilder: (context, index) {
          //
          if (index < personList.length) {
            final person = personList[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: InkWell(
                onTap: () async {
                  await ref
                      .read(personDetailsProvider.notifier)
                      .setValue(person);

                  if (context.mounted) {
                    context.pushNamed('PersonDetailsScreen');
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: constants.background,
                    border: Border.all(
                      color: constants.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // =================== Image, Name & Email =================== //
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // =================== Image =================== //
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: ClipOval(
                                child: Image.network(
                                  person.image!,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                        color: constants.mainText,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Empty Image Link',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                color: constants.subText,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            //
                            const SizedBox(width: 24),

                            // =================== Name & Email =================== //
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Name
                                  Text(
                                    'Name: ${person.firstname} ${person.lastname}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          color: constants.mainText,
                                          fontSize: 16,
                                        ),
                                  ),

                                  //
                                  const SizedBox(height: 4),

                                  // Email
                                  Text(
                                    'Email: ${person.email}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          color: constants.mainText,
                                          fontSize: 16,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // =================== Arrow Icon =================== //
                      IconButton(
                        onPressed: () async {
                          await ref
                              .read(personDetailsProvider.notifier)
                              .setValue(person);

                          if (context.mounted) {
                            context.pushNamed('PersonDetailsScreen');
                          }
                        },
                        icon: const Icon(
                          size: 32,
                          Icons.arrow_right,
                          color: constants.primary,
                        ),
                      )

                      //
                    ],
                  ),
                ),
              ),
            );
          } else {
            // =================== Load Data or No More Data =================== //
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: appendCount != 4
                  ? Center(
                      child: InkWell(
                        onTap: () async {
                          await ref
                              .read(listAppendCountProvider.notifier)
                              .increment();

                          await ref
                              .read(personListControllerProvider.notifier)
                              .fetchPersonList();

                          // if (context.mounted) {
                          //   showSnackBar(
                          //     context,
                          //     'Sucessfully Load More Persons',
                          //     constants.primary,
                          //     Colors.black,
                          //   );
                          // }
                        },
                        child: Container(
                          width: 160,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: constants.primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              'Load More',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    color: constants.primary,
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        'No more data',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontSize: 16,
                              color: constants.mainText,
                            ),
                      ),
                    ),
            );
          }
        },
      ),
    );
  }
}
