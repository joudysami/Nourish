import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nourish/features/home/presentation/pages/home_screen.dart';
import 'package:nourish/features/scan/presentation/pages/scan_screen.dart';
import 'package:nourish/features/scan/presentation/view_model/scan_view_model.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/scan',
      name: 'scan',
      builder: (context, state) {
        return BlocProvider<ScanViewModel>(
          create: (_) => ScanViewModel(),
          child: const ScanScreen(),
        );
      },
    ),
  ],
);
