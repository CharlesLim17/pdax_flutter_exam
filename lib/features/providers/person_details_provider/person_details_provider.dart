import 'package:pdax_flutter_exam/features/models/person_details_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'person_details_provider.g.dart';

// =========================================================================
// To store person details data into a provider for easier manipulation
// =========================================================================
@Riverpod(keepAlive: true)
class PersonList extends _$PersonList {
  @override
  PersonDetailsModel? build() {
    return null;
  }

  Future<void> setValue(PersonDetailsModel personDetailsModel) async {
    state = personDetailsModel;
  }
}
