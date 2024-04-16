import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as constants;
import 'package:pdax_flutter_exam/features/controllers/person_controller.dart';
import 'package:pdax_flutter_exam/features/providers/person_list_provider/person_list_provider.dart';

class TabletPersonListHeader extends ConsumerWidget {
  const TabletPersonListHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appendCount = ref.watch(listAppendCountProvider);

    //
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            'Person List',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: constants.mainText,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
          ),
        ),

        //
        const SizedBox(width: 16),

        //
        Text(
          '$appendCount / 4',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: constants.subText,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
        ),

        //
        const SizedBox(width: 16),

        //
        InkWell(
          onTap: () async {
            await ref.read(listQuantityProvider.notifier).setValue(10);
            ref.invalidate(personListProvider);
            ref.invalidate(listAppendCountProvider);
            ref.invalidate(isPersonFirstFetchProvider);

            await ref
                .read(personListControllerProvider.notifier)
                .fetchPersonList();
            await ref.read(isPersonFirstFetchProvider.notifier).setValue(false);
          },
          child: Container(
            padding: const EdgeInsetsDirectional.all(6),
            decoration: BoxDecoration(
              border: Border.all(
                color: constants.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.refresh,
              color: constants.primary,
              size: 18,
            ),
          ),
        ),

        //
      ],
    );
  }
}
