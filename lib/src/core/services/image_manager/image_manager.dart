class ImageManager {
  const ImageManager._();
  static const String _baseImagePath = 'assets/images/';
  static const AppIcons icons = AppIcons();
  static const Illustrations illustrations = Illustrations();

  static String path(String subPath) => '$_baseImagePath$subPath';
}

class AppIcons {
  const AppIcons();
  String get icon => ImageManager.path('icons/icon.svg');
  String get backArrow => ImageManager.path('icons/back-arrow.svg');
  String get rightArrow => ImageManager.path('icons/right-arrow.svg');
  String get delete => ImageManager.path('icons/delete.svg');
  String get edit => ImageManager.path('icons/edit.svg');
  String get more => ImageManager.path('icons/more.svg');
  String get category => ImageManager.path('icons/category.svg');
  String get tag => ImageManager.path('icons/tag.svg');
  String get add => ImageManager.path('icons/add.svg');
  String get check => ImageManager.path('icons/check.svg');
  String get settings => ImageManager.path('icons/settings.svg');
  String get image => ImageManager.path('icons/image.svg');
  String get avatar => ImageManager.path('icons/avatar.svg');
  String get visibility => ImageManager.path('icons/visibility.svg');
  String get search => ImageManager.path('icons/search.svg');
}

class Illustrations {
  const Illustrations();

  String get fatalError => ImageManager.path('illustrations/fatal_error.png');
}
