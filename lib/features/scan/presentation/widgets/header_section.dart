import 'package:flutter/material.dart';
import 'package:nourish/features/scan/presentation/view_model/scan_state.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.state, required this.onFlash});

  final ScanState state;
  final VoidCallback onFlash;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.08),
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 20),
              onPressed: () => Navigator.of(context).maybePop(),
            ),
          ),

          Column(
            children: const [
              Text(
                'Scan your food',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Point your camera at the package.',
                style: TextStyle(color: Color(0xFFB0A2BF), fontSize: 12),
              ),
            ],
          ),

          // Flash button
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.08),
            child: IconButton(
              icon: Icon(
                state.isTorchOn ? Icons.flash_on : Icons.flash_off,
                color: state.isTorchOn ? const Color(0xFFFFD166) : Colors.white,
                size: 20,
              ),
              onPressed: onFlash,
            ),
          ),
        ],
      ),
    );
  }
}
