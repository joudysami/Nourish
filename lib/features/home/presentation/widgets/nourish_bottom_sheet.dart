import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish/core/theme/app_color.dart';

class NourishBottomSheet extends StatelessWidget {
  const NourishBottomSheet({
    super.key,
    required this.currentIndex,
    required this.onChanged,
    this.onScanPressed,
  });

  final int currentIndex;
  final ValueChanged<int> onChanged;
  final VoidCallback? onScanPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SafeArea(
      minimum: EdgeInsets.fromLTRB(30.w, 0, 20.w, 22.h),
      child: Container(
        height: 72.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: colors.plum[600],
          borderRadius: BorderRadius.circular(40.r),
          boxShadow: [
            BoxShadow(
              color: colors.plum.withValues(alpha: 0.35),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _NavItem(
              icon: Icons.home_rounded,
              title: "Home",
              selected: currentIndex == 0,
              onTap: () => onChanged(0),
            ),
            _ScanNavButton(onTap: onScanPressed ?? () => onChanged(2)),
            _NavItem(
              icon: Icons.bookmark_border_rounded,
              title: "Discoveries",
              selected: currentIndex == 3,
              onTap: () => onChanged(3),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.selected,
    required this.onTap,
    required this.title,
  });

  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // تضبيط المحاذاة رأسياً
          children: [
            Icon(
              icon,
              size: 24.r,
              color: selected
                  ? colors.white
                  : colors.white.withValues(alpha: 0.38),
            ),
            SizedBox(height: 4.h),
            Text(
              title,
              style: TextStyle(
                color: selected
                    ? colors.white
                    : colors.white.withValues(alpha: 0.38),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScanNavButton extends StatelessWidget {
  const _ScanNavButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: GestureDetector(
        onTap: onTap,
        child: Transform.translate(
          offset: Offset(0, -10.h),
          child: Container(
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  colors.peach[400]!,
                  colors.purple[700]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: colors.purple[400]!.withValues(alpha: 0.45),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              Icons.photo_camera_outlined,
              color: colors.plum.shade800,
              size: 24.r,
            ),
          ),
        ),
      ),
    );
  }
}