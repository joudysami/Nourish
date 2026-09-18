import 'package:camera/camera.dart';
import 'package:nourish/core/base/base_state.dart';

class ScanState {
  final BaseState<void> status; // BaseInitial, BaseLoading, BaseSuccess, BaseError
  final CameraController? controller;
  final FlashMode flashMode;
  final CameraLensDirection lensDirection;
  final List<String> categories;
  final int selectedCategory;
  final int currentTabIndex;
  final String? capturedPath;

  const ScanState({
    this.status = const BaseState(),
    this.controller,
    this.flashMode = FlashMode.off,
    this.lensDirection = CameraLensDirection.back,
    this.categories = const ['Matcha', 'Artisan Dark', 'Wild Blueberry', 'Cold-Press'],
    this.selectedCategory = 0,
    this.currentTabIndex = 1,
    this.capturedPath,
  });

  bool get isTorchOn => flashMode == FlashMode.torch;

  ScanState copyWith({
    BaseState<void>? status,
    CameraController? controller,
    FlashMode? flashMode,
    CameraLensDirection? lensDirection,
    List<String>? categories,
    int? selectedCategory,
    int? currentTabIndex,
    String? capturedPath,
  }) {
    return ScanState(
      status: status ?? this.status,
      controller: controller ?? this.controller,
      flashMode: flashMode ?? this.flashMode,
      lensDirection: lensDirection ?? this.lensDirection,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      capturedPath: capturedPath ?? this.capturedPath,
    );
  }
}