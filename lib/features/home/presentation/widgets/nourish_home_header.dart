import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish/core/theme/app_color.dart';
import 'package:nourish/features/home/presentation/widgets/notification_bell_button.dart';
import 'package:nourish/features/home/presentation/widgets/profile_avatar_button.dart';

class NourishHomeHeader extends StatelessWidget {
  const NourishHomeHeader({
    super.key,
    this.onNotificationsPressed,
    this.onProfilePressed,
  });

  final VoidCallback? onNotificationsPressed;
  final VoidCallback? onProfilePressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      children: [
        Container(
      width: 42.w,
      height: 42.w,
      decoration: BoxDecoration(
        color: colors.purple[400],
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Icon(
        Icons.eco_rounded,
        color: colors.white,
        size: 24,
      ),
    ),
        SizedBox(width: 10.w),
        Text(
          'Nourish',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: colors.plum[900],
            letterSpacing: -0.4,
          ),
        ),
        const Spacer(),
        NotificationBellButton(onPressed: onNotificationsPressed),
        SizedBox(width: 8.w),
        ProfileAvatarButton(onPressed: onProfilePressed),
      ],
    );
  }
}
