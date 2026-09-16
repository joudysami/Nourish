import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish/core/theme/app_color.dart';

class ProfileAvatarButton extends StatelessWidget {
  const ProfileAvatarButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: colors.peach[200],
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.person_outline_rounded,
          color: colors.white,
          size: 22,
        ),
      ),
    );
  }
}
