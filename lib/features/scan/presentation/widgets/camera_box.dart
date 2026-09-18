import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:nourish/features/scan/presentation/view_model/scan_event.dart';
import 'package:nourish/features/scan/presentation/view_model/scan_state.dart';
import 'package:nourish/features/scan/presentation/view_model/scan_view_model.dart';

class CameraBox extends StatefulWidget {
  const CameraBox({super.key});

  @override
  State<CameraBox> createState() => _CameraBoxState();
}

class _CameraBoxState extends State<CameraBox> {
  late final ScanViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = ScanViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ScanState>(
      stream: _viewModel.stream,
      initialData: _viewModel.state,
      builder: (context, snapshot) {
        final state = snapshot.data!;

        if (state.controller == null ||
            !state.controller!.value.isInitialized) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFF191120),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Center(
              child: CircularProgressIndicator(color: Color(0xFF8F73B8)),
            ),
          );
        }

        return ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Camera Preview
              CameraPreview(state.controller!),

              Center(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white38, width: 1.5),
                  ),
                  child: Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE5989B),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),

              // Top Category Chips
              Positioned(
                top: 12,
                left: 0,
                right: 0,
                height: 36,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  itemCount: state.categories.length,
                  itemBuilder: (context, i) {
                    final isSelected = i == state.selectedCategory;
                    return GestureDetector(
                      onTap: () => _viewModel.doEvent(SelectCategoryEvent(i)),
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF8F73B8)
                              : Colors.black45,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFFBCA6DC)
                                : Colors.white12,
                          ),
                        ),
                        child: Text(
                          state.categories[i],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Bottom floating info label
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white70,
                          size: 14,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Keep the product label visible.',
                          style: TextStyle(color: Colors.white, fontSize: 11.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
