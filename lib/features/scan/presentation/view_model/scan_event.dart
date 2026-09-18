sealed class ScanEvent {}

class InitCameraEvent extends ScanEvent {}

class ToggleFlashEvent extends ScanEvent {}

class SwitchCameraEvent extends ScanEvent {}

class CapturePhotoEvent extends ScanEvent {}

class PickGalleryImageEvent extends ScanEvent {}

class SelectCategoryEvent extends ScanEvent {
  final int index;
  SelectCategoryEvent(this.index);
}

class ChangeTabEvent extends ScanEvent {
  final int index;
  ChangeTabEvent(this.index);
}