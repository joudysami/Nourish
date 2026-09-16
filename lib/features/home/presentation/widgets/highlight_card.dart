import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish/core/theme/app_color.dart';

class HighlightCard extends StatelessWidget {
  const HighlightCard({
    super.key,
    required this.icon,
    required this.iconBackground,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: colors.white.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: colors.grey[200]!),
      ),
      child: Column(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: colors.plum[800],
              height: 1.2,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: colors.grey[600],
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureHighlightsRow extends StatelessWidget {
  const FeatureHighlightsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      children: [
        Expanded(
          child: HighlightCard(
            icon: Icons.verified_user_outlined,
            iconBackground: const Color(0xFFE6F6EE),
            iconColor: colors.success,
            title: '100% Clean',
            subtitle: 'Label Decoder',
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: HighlightCard(
            icon: Icons.water_drop_outlined,
            iconBackground: colors.peach[100]!,
            iconColor: colors.flame[400]!,
            title: 'Instant AI',
            subtitle: 'Macro Facts',
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: HighlightCard(
            icon: Icons.workspace_premium_outlined,
            iconBackground: colors.purple[100]!,
            iconColor: colors.purple[500]!,
            title: 'Smart Grade',
            subtitle: 'Nourish Score',
          ),
        ),
      ],
    );
  }
}
