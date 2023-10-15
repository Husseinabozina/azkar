import 'package:azkary/Features/Azkar/presentation/view/azkar_view.dart';
import 'package:azkary/Features/Home/presentation/view/home_view.dart';
import 'package:azkary/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kHomeView = '/homeView';
  static const kAzkarView = '/AzkarView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kAzkarView,
      builder: (context, state) => const AzkarView(),
    ),
  ]);
}
