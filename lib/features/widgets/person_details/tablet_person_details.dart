import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/features/providers/person_details_provider/person_details_provider.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as constants;
import 'package:pdax_flutter_exam/features/widgets/person_details/components/tablet_components/tablet_person_details_address.dart';
import 'package:pdax_flutter_exam/features/widgets/person_details/components/tablet_components/tablet_person_specific_details.dart';

class TabletPersonDetails extends ConsumerWidget {
  const TabletPersonDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(personDetailsProvider);

    //
    return Scaffold(
      // =================== Scaffold Styles =================== //
      backgroundColor: constants.background,

      // =================== Scaffold Body =================== //
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                const SizedBox(height: 32),

                // =================== Image =================== //
                Center(
                  child: SizedBox(
                    height: 125,
                    width: 125,
                    child: ClipOval(
                      child: Image.network(
                        person!.image!,
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
                        loadingBuilder: (context, child, loadingProgress) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: constants.primary,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                //
                const SizedBox(height: 32),

                // =================== Personal Details =================== //
                TabletPersonSpecificDetails(person: person),

                //
                const SizedBox(height: 32),

                //
                Divider(
                  color: constants.primary.withOpacity(.30),
                  thickness: 1.5,
                ),

                //
                const SizedBox(height: 32),

                // =================== Address Details =================== //
                TabletPersonalDetailsAddress(person: person),

                //
                const SizedBox(height: 48),

                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
