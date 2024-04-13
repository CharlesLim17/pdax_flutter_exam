import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pdax_flutter_exam/config/provider/dio_provider.dart';
import 'package:pdax_flutter_exam/features/models/person_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'person_controller.g.dart';

@riverpod
class FetchPersons extends _$FetchPersons {
  // Method to fetch person list
  FutureOr<PersonModel> getPersons() async {
    final dio = ref.watch(dioProvider);

    try {
      Response response = await dio.get(
        '/persons',
        queryParameters: {'quantity': 20},
      );

      debugPrint('Fetched Persons ${response.data.toString()}');

      return PersonModel.fromJson(response.data);
    } catch (e) {
      debugPrint('Error Fetching Persons: $e');
      return PersonModel();
    }
  }

  @override
  FutureOr<PersonModel> build() {
    return getPersons();
  }
}
