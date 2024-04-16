import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pdax_flutter_exam/config/provider/dio_provider.dart';
import 'package:pdax_flutter_exam/features/models/person_model.dart';
import 'package:pdax_flutter_exam/features/providers/person_list_provider/person_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'person_controller.g.dart';

// =========================================================================
// Person List Controller
// =========================================================================
@riverpod
class PersonListController extends _$PersonListController {
  // =========================================================================
  // Method To Fetch Person Data
  // =========================================================================
  Future<void> fetchPersonList() async {
    final dio = ref.watch(dioProvider);
    final quantity = ref.watch(listQuantityProvider);
    final isFirstFetch = ref.watch(isPersonFirstFetchProvider);

    debugPrint('Fetch Quantity $quantity');
    debugPrint('Is First Fetched $isFirstFetch');

    try {
      Response response = await dio.get(
        '/persons',
        queryParameters: {'_quantity': quantity},
      );

      debugPrint('Fetched Persons Status Code ${response.statusCode}');
      debugPrint('Fetched Persons ${response.data}');

      if (response.statusCode == 200) {
        // Parse response data to list
        PersonModel personModel = PersonModel.fromJson(response.data);
        List<Datum> dataList = personModel.data!;

        // Add / Append Values to the list
        ref.read(personListProvider.notifier).addValues(dataList);

        // After the initial fetch of 10 persons set the quantity for the next fetch to 20
        if (isFirstFetch) {
          ref.read(listQuantityProvider.notifier).setValue(20);
          await ref.read(isPersonFirstFetchProvider.notifier).setValue(false);
        }
      }

      //
    } catch (e) {
      debugPrint('Error Fetching Persons: $e');
    }
  }

  @override
  build() {
    return fetchPersonList();
  }
}
