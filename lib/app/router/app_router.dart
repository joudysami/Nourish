import 'package:go_router/go_router.dart';
import 'package:nourish/features/home/presentation/pages/home_screen.dart';
import 'package:nourish/features/scan/presentation/pages/scan_screen.dart';

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
      builder: (context, state) => const ScanScreen(),
    ),
  ],
);