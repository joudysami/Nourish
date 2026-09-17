import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish/core/theme/app_color.dart';

class DecoderBadge extends StatelessWidget {
  const DecoderBadge({
    super.key,
    this.label = 'Instant Nutrition & Ingredient Decoder',
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
        decoration: BoxDecoration(
          color: colors.purple[50],
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.auto_awesome,
              size: 15,
              color: colors.purple[400],
            ),
            SizedBox(width: 6.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: colors.purple[500],
                letterSpacing: -0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
