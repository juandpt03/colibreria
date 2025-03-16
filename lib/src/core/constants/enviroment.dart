import 'package:colibreria/src/core/services/injector/injector_conf.dart';
import 'package:colibreria/src/core/utils/env_loader.dart';

class Environment {
  static final Environment _instance = Environment._internal();
  static final EnvLoader _envLoader = DI.sl.get();

  Environment._internal();

  factory Environment() => _instance;

  final apiUrl = _envLoader.get('API_URL') ?? '';
}
