import 'package:go_router/go_router.dart';
import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/core/router/app_route_path.dart';
import 'package:colibreria/src/features/home/presentation/screens/home/home_screen.dart';

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
