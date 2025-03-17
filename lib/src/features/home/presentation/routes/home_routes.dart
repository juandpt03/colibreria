import 'package:colibreria/src/features/home/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';
import 'package:colibreria/src/core/core.dart';

class HomeRoutes {
  HomeRoutes._();
  static List<RouteBase> getRoutes() {
    return [
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        pageBuilder:
            (context, state) => TransitionManager().slideTransition(
              child: const HomeScreen(),
              state: state,
            ),
      ),
    ];
  }
}
