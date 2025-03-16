import 'package:go_router/go_router.dart';
import 'package:colibreria/src/features/home/presentation/routes/home_routes.dart';

import 'app_route_path.dart';

class AppRouteConf {
  GoRouter get router => _router;

  late final _router = GoRouter(
    initialLocation: AppRoute.home.path,
    debugLogDiagnostics: true,
    routes: [...HomeRoutes.getRoutes()],
  );
}
