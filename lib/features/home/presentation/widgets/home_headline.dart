import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish/core/theme/app_color.dart';

class HomeHeadline extends StatelessWidget {
  const HomeHeadline({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Know what you're\neating.",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            height: 1.08,
            letterSpacing: -1.2,
            color: colors.plum[900],
          ),
        ),
        SizedBox(height: 12.h),
        Text(
         'Snap a product label. Get the full picture instantly.',
          style: TextStyle(
            fontSize: 15,
            height: 1.4,
            color: colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
