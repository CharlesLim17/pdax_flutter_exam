import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dimensions_provider.freezed.dart';
part 'dimensions_provider.g.dart';

/// The `DimensionState` class is a freezed union class in Dart that represents different dimensions of
/// a device, including mobile, tablet, and desktop.
@freezed
class DimensionState with _$DimensionState {
  factory DimensionState.mobile() = DimensionMobile;
  factory DimensionState.tablet() = DimensionTablet;
  factory DimensionState.desktop() = DimensionDesktop;
}

/// The `DimensionController` class is a Riverpod state controller that manages the current dimension
/// state and provides methods to switch between different dimension states.
@Riverpod(keepAlive: true)
class DimensionController extends _$DimensionController {
  @override
  DimensionState build() {
    return DimensionDesktop();
  }

  /// The function sets the state to DimensionMobile.
  isMobile() {
    state = DimensionMobile();
  }

  /// The function sets the state to indicate that the device is a tablet.
  isTablet() {
    state = DimensionTablet();
  }

  /// The function sets the state to DimensionDesktop.
  isDesktop() {
    state = DimensionDesktop();
  }
}
