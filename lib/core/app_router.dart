import 'package:azkary/views/home_view.dart';
import 'package:azkary/views/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kHomeView = '/homeview';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
  ]);
}
