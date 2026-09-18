import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'scan_event.dart';
import 'scan_state.dart';

class ScanViewModel extends Cubit<ScanState> {
  final ImagePicker _picker = ImagePicker();
  List<CameraDescription> _cameras = [];

  ScanViewModel() : super(const ScanState()) {
    doEvent(InitCameraEvent());
  }

  void doEvent(ScanEvent event) {
    switch (event) {
      case InitCameraEvent():
        _initCamera();
        break;
      case ToggleFlashEvent():
        _toggleFlash();
        break;
      case SwitchCameraEvent():
        _switchCamera();
        break;
      case CapturePhotoEvent():
        _capturePhoto();
        break;
      case PickGalleryImageEvent():
        _pickFromGallery();
        break;
      case SelectCategoryEvent():
        emit(state.copyWith(selectedCategory: event.index));
        break;
      case ChangeTabEvent():
        emit(state.copyWith(currentTabIndex: event.index));
        break;
    }
  }

  Future<void> _initCamera() async {
    try {
      emit(
        state.copyWith(
          status: state.status.copyWith(isLoading: true, errorMessage: ""),
        ),
      );
      _cameras = await availableCameras();

      if (_cameras.isEmpty) {
        emit(
          state.copyWith(
            status: state.status.copyWith(
              errorMessage: 'No cameras found on device',
              isLoading: false,
            ),
          ),
        );
        return;
      }

      final camera = _cameras.firstWhere(
        (c) => c.lensDirection == state.lensDirection,
        orElse: () => _cameras.first,
      );

      final controller = CameraController(
        camera,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await controller.initialize();

      emit(
        state.copyWith(
          status: state.status.copyWith(isLoading: false, data: null),
          controller: controller,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: state.status.copyWith(errorMessage: (e.toString())),
        ),
      );
    }
  }

  Future<void> _toggleFlash() async {
    final controller = state.controller;
    if (controller == null || !controller.value.isInitialized) return;

    try {
      final nextMode = state.isTorchOn ? FlashMode.off : FlashMode.torch;
      await controller.setFlashMode(nextMode);
      emit(state.copyWith(flashMode: nextMode));
    } catch (e) {
      // Ignore or log error
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras.length < 2) return;

    final nextLens = state.lensDirection == CameraLensDirection.back
        ? CameraLensDirection.front
        : CameraLensDirection.back;

    await state.controller?.dispose();
    emit(state.copyWith(lensDirection: nextLens));
    await _initCamera();
  }

  Future<void> _capturePhoto() async {
    final controller = state.controller;
    if (controller == null || !controller.value.isInitialized) return;

    try {
      emit(state.copyWith(status: state.status.copyWith(isLoading: true)));
      final XFile photo = await controller.takePicture();
      emit(
        state.copyWith(
          status: state.status.copyWith(data: null, isLoading: false),
          capturedPath: photo.path,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: state.status.copyWith(
            errorMessage: ('Failed to take picture: $e'),
            isLoading: false,
          ),
        ),
      );
    }
  }

  Future<void> _pickFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        emit(
          state.copyWith(
            status: state.status.copyWith(data: null, isLoading: false),
            capturedPath: image.path,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: state.status.copyWith(
            errorMessage: ('Failed to pick image: $e'),
            isLoading: false,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    state.controller?.dispose();
    close();
  }
}
