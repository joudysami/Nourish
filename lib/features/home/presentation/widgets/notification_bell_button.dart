import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish/core/theme/app_color.dart';

class NotificationBellButton extends StatelessWidget {
  const NotificationBellButton({
    super.key,
    this.hasNotification = true,
    this.onPressed,
  });

  final bool hasNotification;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20.r),
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.notifications_none_rounded,
              color: colors.plum[800],
              size: 26,
            ),
            if (hasNotification)
              Positioned(
                top: 6.h,
                right: 7.w,
                child: Container(
                  width: 8.w,
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: colors.peach[400],
                    shape: BoxShape.circle,
                    border: Border.all(color: colors.grey[100]!, width: 1.2),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
