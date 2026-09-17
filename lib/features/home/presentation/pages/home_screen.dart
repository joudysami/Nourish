import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish/core/theme/app_color.dart';
import 'package:nourish/features/home/presentation/widgets/ai_scanner_card.dart';
import 'package:nourish/features/home/presentation/widgets/decoder_badge.dart';
import 'package:nourish/features/home/presentation/widgets/highlight_card.dart';
import 'package:nourish/features/home/presentation/widgets/home_headline.dart';
import 'package:nourish/features/home/presentation/widgets/nourish_bottom_sheet.dart';
import 'package:nourish/features/home/presentation/widgets/nourish_home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.grey[50],
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 120.h),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NourishHomeHeader(),
              SizedBox(height: 28),
              DecoderBadge(),
              SizedBox(height: 16),
              HomeHeadline(),
              SizedBox(height: 28),
              AiScannerCard(),
              SizedBox(height: 18),
              FeatureHighlightsRow(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NourishBottomSheet(
        currentIndex: _tabIndex,
        onChanged: (index) => setState(() => _tabIndex = index),
      ),
    );
  }
}
