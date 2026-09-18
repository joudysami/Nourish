
import 'package:flutter/material.dart';
import 'package:nourish/features/scan/presentation/view_model/scan_event.dart';
import 'package:nourish/features/scan/presentation/view_model/scan_state.dart';
import 'package:nourish/features/scan/presentation/view_model/scan_view_model.dart';
import 'package:nourish/features/scan/presentation/widgets/action_button.dart';

class ScanControls extends StatelessWidget {
  const ScanControls({required this.state, required this.cubit});

  final ScanState state;
  final ScanViewModel cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActionButton(
            icon: Icons.flip_camera_android_rounded,
            label: 'Switch camera',
            onTap: () => cubit.doEvent(SwitchCameraEvent()),
          ),
          _ShutterButton(
            isLoading: state.status.isLoading,
            onTap: () => cubit.doEvent(CapturePhotoEvent()),
          ),
          ActionButton(
            icon: Icons.photo_library_outlined,
            label: 'Gallery',
            onTap: () => cubit.doEvent(PickGalleryImageEvent()),
          ),
        ],
      ),
    );
  }
}

class _ShutterButton extends StatelessWidget {
  const _ShutterButton({required this.isLoading, required this.onTap});

  final bool isLoading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Capture photo',
      child: InkWell(
        onTap: isLoading ? null : onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: 78,
          height: 78,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFBFA6DC), width: 3),
          ),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF8F73B8),
            ),
            child: isLoading
                ? const Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(
                    Icons.camera_alt_outlined,
                    color: Color(0xFF22172A),
                    size: 30,
                  ),
          ),
        ),
      ),
    );
  }
}

