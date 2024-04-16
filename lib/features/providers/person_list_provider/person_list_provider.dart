import 'package:pdax_flutter_exam/features/models/person_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'person_list_provider.g.dart';

// =========================================================================
// To store all the fetched data into a provider for easier manipulation
// =========================================================================
@Riverpod(keepAlive: true)
class PersonList extends _$PersonList {
  @override
  List<Datum> build() {
    return [];
  }

  Future<void> addValues(List<Datum> values) async {
    state.addAll(values);
  }
}

// =========================================================================
// Used set dynamic quantity in fetching of persons
// =========================================================================
@Riverpod(keepAlive: true)
class ListQuantity extends _$ListQuantity {
  @override
  int build() {
    return 10;
  }

  Future<void> setValue(int quantity) async {
    state = quantity;
  }
}

// =========================================================================
// Append/Add Count
// =========================================================================
@Riverpod(keepAlive: true)
class ListAppendCount extends _$ListAppendCount {
  @override
  int build() {
    return 1;
  }

  Future<void> increment() async {
    state += 1;
  }
}

// =========================================================================
// Identifier if it is the first/initial load or not
// =========================================================================
@Riverpod(keepAlive: true)
class IsPersonFirstFetch extends _$IsPersonFirstFetch {
  @override
  bool build() {
    return true;
  }

  Future<void> setValue(bool value) async {
    state = value;
  }
}
