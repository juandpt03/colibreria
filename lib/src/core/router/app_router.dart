import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/auth/presentation/routes/auth_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:colibreria/src/features/home/presentation/routes/home_routes.dart';

class AppRouter {
  GoRouter get router => _router;

  late final _router = GoRouter(
    initialLocation: AppRoute.splash.path,
    debugLogDiagnostics: true,
    routes: [...AuthRoutes().getRoutes(), ...HomeRoutes.getRoutes()],
  );
}
