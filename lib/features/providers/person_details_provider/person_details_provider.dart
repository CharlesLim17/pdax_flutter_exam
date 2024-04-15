import 'package:pdax_flutter_exam/features/models/person_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'person_details_provider.g.dart';

// =========================================================================
// To store person details data into a provider for easier manipulation
// =========================================================================
@Riverpod(keepAlive: true)
class PersonDetails extends _$PersonDetails {
  @override
  Datum? build() {
    return null;
  }

  Future<void> setValue(Datum datum) async {
    state = datum;
  }
}
