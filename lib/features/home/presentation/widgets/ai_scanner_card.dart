import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nourish/core/theme/app_color.dart';
class AiScannerCard extends StatelessWidget {
  const AiScannerCard({super.key, this.onScanPressed});

  final VoidCallback? onScanPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 18.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.purple.shade700,
            colors.plum[700]!,
           colors.purple.shade700,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: colors.plum.withValues(alpha: 0.28),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20.w,
            top: 40.h,
            child: IgnorePointer(
              child: Container(
                width: 160.w,
                height: 160.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      colors.purple[400]!.withValues(alpha: 0.35),
                      colors.purple[400]!.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _ScannerStatusRow(),
              SizedBox(height: 14.h),
              const _ScanInfoPanel(),
              SizedBox(height: 16.h),
              _ScanProductButton(onPressed: onScanPressed),
            ],
          ),
        ],
      ),
    );
  }
}

class _ScannerStatusRow extends StatelessWidget {
  const _ScannerStatusRow();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
          decoration: BoxDecoration(
            color: colors.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: colors.white.withValues(alpha: 0.08),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.bolt_rounded,
                size: 16.r,
                color: colors.peach[300],
              ),
              SizedBox(width: 4.w),
              Text(
                'AI Scanner Ready',
                style: TextStyle(
                  color: colors.white.withValues(alpha: 0.92),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        CustomPaint(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Text(
              'Tap to launch',
              style: TextStyle(
                color: colors.white.withValues(alpha: 0.72),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ScanInfoPanel extends StatelessWidget {
  const _ScanInfoPanel();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(14.w, 16.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: colors.white.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ScanIconWidget(),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Scan Food Package',
                  style: TextStyle(
                    color: colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Detects calories, sugars, additives & hidden ultra-processed ingredients in seconds.',
                  style: TextStyle(
                    color: colors.white.withValues(alpha: 0.72),
                    fontSize: 13.sp,
                    height: 1.35,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScanIconWidget extends StatelessWidget {
  const _ScanIconWidget();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: 68.w,
      height: 78.h,
      decoration: BoxDecoration(
        color: colors.peach[300]!.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colors.peach[300]!.withValues(alpha: 0.3),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.document_scanner_rounded,
          color: colors.peach[300],
          size: 32.r,
        ),
      ),
    );
  }
}

class _ScanProductButton extends StatelessWidget {
  const _ScanProductButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed:  () {
context.pushNamed('scan');        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.white,
          foregroundColor: colors.plum[800],
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.photo_camera_outlined, size: 18.r),
            SizedBox(width: 8.w),
            Text(
              'Scan a Product',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 4.w),
            Icon(Icons.chevron_right_rounded, size: 22.r),
          ],
        ),
      ),
    );
  }
}