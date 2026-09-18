import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nourish/features/scan/presentation/view_model/scan_event.dart';
import 'package:nourish/features/scan/presentation/view_model/scan_state.dart';
import 'package:nourish/features/scan/presentation/view_model/scan_view_model.dart';
import 'package:nourish/features/scan/presentation/widgets/camera_box.dart';
import 'package:nourish/features/scan/presentation/widgets/header_section.dart';
import 'package:nourish/features/scan/presentation/widgets/scan_button.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF22172A),
      body: BlocListener<ScanViewModel, ScanState>(
        listenWhen: (previous, current) =>
            previous.status.errorMessage != current.status.errorMessage ||
            previous.capturedPath != current.capturedPath,
        listener: (context, state) {
          final message = state.status.errorMessage.isNotEmpty
              ? state.status.errorMessage
              : state.capturedPath == null
              ? null
              : 'Photo ready to review';
          if (message != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(message)));
          }
        },
        child: BlocBuilder<ScanViewModel, ScanState>(
          builder: (context, state) {
            final cubit = context.read<ScanViewModel>();
            return SafeArea(
              bottom: false,
              child: Column(
                children: [
                  HeaderSection(
                    state: state,
                    onFlash: () => cubit.doEvent(ToggleFlashEvent()),
                  ),
                  const SizedBox(height: 10),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: CameraBox(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ScanControls(state: state, cubit: cubit),
                  const SizedBox(height:30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
