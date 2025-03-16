import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/auth/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

class AuthRoutes {
  List<RouteBase> getRoutes() {
    final transitionManager = TransitionManager();

    return [
      GoRoute(
        path: AppRoute.splash.path,
        name: AppRoute.splash.name,
        pageBuilder:
            (context, state) => transitionManager.scaleFadeTransitionPage(
              state: state,
              child: const SplashScreen(),
            ),
      ),
    ];
  }
}
