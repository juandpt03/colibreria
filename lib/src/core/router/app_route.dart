enum AppRoute {
  splash(path: '/splash'),
  home(path: '/home'),
  bookDetail(path: '/book-detail', parent: AppRoute.home);

  const AppRoute({required this.path, this.parent});

  final String path;
  final AppRoute? parent;

  String get name => path.split('/').last;

  String get fullPath {
    if (parent == null) return path;
    return '${parent?.fullPath}$path';
  }

  factory AppRoute.fromFullPath(String fullPath) {
    return AppRoute.values.firstWhere(
      (route) => route.fullPath == fullPath,
      orElse: () => AppRoute.home,
    );
  }
}
