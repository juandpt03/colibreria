import 'package:get_it/get_it.dart';
import 'package:colibreria/src/core/core.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

class DI {
  DI._internal();
  static final sl = GetIt.I;

  static setup() async {
    await _setupHydratedStorage();
    await EnvLoader().loadEnv('.env');
    sl.registerLazySingleton(() => EnvLoader());
    sl.registerLazySingleton(() => AppRouter());
    sl.registerLazySingleton(() => Environment());
    sl.registerLazySingleton(() => AppTheme());
    AuthDepedency.init();
  }

  static Future<void> _setupHydratedStorage() async {
    final storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(
        (await getTemporaryDirectory()).path,
      ),
    );
    HydratedBloc.storage = storage;
    sl.registerSingleton<HydratedStorage>(storage);
  }
}
