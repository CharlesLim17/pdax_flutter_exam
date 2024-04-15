// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$personListHash() => r'216b33a87dfcd31fcc4c5b528ebb13a2b12f4a78';

/// See also [PersonList].
@ProviderFor(PersonList)
final personListProvider = NotifierProvider<PersonList, List<Datum>>.internal(
  PersonList.new,
  name: r'personListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$personListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PersonList = Notifier<List<Datum>>;
String _$listQuantityHash() => r'5641043846e69a868df35accabee5065b515a2d5';

/// See also [ListQuantity].
@ProviderFor(ListQuantity)
final listQuantityProvider = NotifierProvider<ListQuantity, int>.internal(
  ListQuantity.new,
  name: r'listQuantityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$listQuantityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListQuantity = Notifier<int>;
String _$isPersonFirstFetchHash() =>
    r'f6616987b0fd1a78ce537c82c5139ef9f5e6c636';

/// See also [IsPersonFirstFetch].
@ProviderFor(IsPersonFirstFetch)
final isPersonFirstFetchProvider =
    NotifierProvider<IsPersonFirstFetch, bool>.internal(
  IsPersonFirstFetch.new,
  name: r'isPersonFirstFetchProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isPersonFirstFetchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsPersonFirstFetch = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
