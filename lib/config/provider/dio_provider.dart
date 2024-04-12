import 'package:dio/dio.dart';
import 'package:pdax_flutter_exam/config/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  final apiUrl = Environment.apiUrl;

  final options = BaseOptions(baseUrl: apiUrl, contentType: 'application/json');

  final dio = Dio(options);

  return dio;
}
