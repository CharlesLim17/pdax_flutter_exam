import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as constants;
import 'package:pdax_flutter_exam/features/providers/person_details_provider/person_details_provider.dart';
import 'package:pdax_flutter_exam/features/widgets/person_details/components/mobile_components/mobile_person_details_address.dart';
import 'package:pdax_flutter_exam/features/widgets/person_details/components/mobile_components/mobile_person_specific_details.dart';

class MobilePersonDetails extends ConsumerWidget {
  const MobilePersonDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(personDetailsProvider);

    //
    return Scaffold(
      // =================== Scaffold Styles =================== //
      backgroundColor: constants.background,

      // =================== App Bar =================== //
      appBar: AppBar(
        backgroundColor: constants.primary,
        title: Text(
          'Person Id: ${person!.id!}',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
      ),

      // =================== Scaffold Body =================== //
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                const SizedBox(height: 24),

                // =================== Image =================== //
                Center(
                  child: SizedBox(
                    height: 120,
                    width: 120,
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
                                      fontSize: 14,
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
                const SizedBox(height: 24),

                // =================== Personal Details =================== //
                MobilePersonSpecificDetails(person: person),

                //
                const SizedBox(height: 24),

                //
                Divider(
                  color: constants.primary.withOpacity(.30),
                  thickness: 1.5,
                ),

                //
                const SizedBox(height: 24),

                // =================== Address Details =================== //
                MobilePersonDetailsAddress(person: person),

                //
                const SizedBox(height: 24),

                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
