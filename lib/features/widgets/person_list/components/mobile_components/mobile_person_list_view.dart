import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as constants;
import 'package:pdax_flutter_exam/features/models/person_model.dart';

class MobilePersonListView extends ConsumerWidget {
  const MobilePersonListView({
    super.key,
    required this.personList,
    required this.appendCount,
  });

  final List<Datum> personList;
  final int appendCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: personList.length + 1,
      itemBuilder: (context, index) {
        //
        if (index < personList.length) {
          final person = personList[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // =================== Image =================== //
                  SizedBox(
                    height: 45,
                    width: 45,
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
                                      fontSize: 9,
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
                  const SizedBox(width: 16),

                  // =================== Name & Email =================== //
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        Text(
                          'Name: ${person.firstname} ${person.lastname}',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: constants.mainText,
                                    fontSize: 12,
                                  ),
                        ),

                        //
                        const SizedBox(height: 4),

                        // Email
                        Text(
                          'Email: ${person.email}',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: constants.mainText,
                                    fontSize: 12,
                                  ),
                        ),
                      ],
                    ),
                  ),

                  //
                ],
              ),
            ),
          );
        } else {
          // =================== Load Data or No More Data =================== //
          return appendCount != 4
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: constants.primary,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  child: Center(
                    child: Text(
                      'No more data',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 14,
                            color: constants.mainText,
                          ),
                    ),
                  ),
                );
        }
      },
    );
  }
}
