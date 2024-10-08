import 'package:go_router/go_router.dart';
import 'package:groove_box/core/utils/animations/transition_animation.dart';
import 'package:groove_box/features/home/presentation/view/home_view.dart';
import 'package:groove_box/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const homePath = '/home';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: homePath,
      pageBuilder: (context, state) {
        return TransitionAnimation.circularTransitionAnimation(state,
            route: const HomeView());
      },
    ),
  ]);
}
