import 'package:dio/dio.dart';
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
    sl.registerLazySingleton(() => Environment());
    setupClient();
    sl.registerLazySingleton(() => AppRouter());
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

  static setupClient() {
    sl.registerSingleton<Dio>(
      Dio(
          BaseOptions(
            baseUrl: sl.get<Environment>().apiUrl,
            contentType: 'application/json',
          ),
        )
        ..interceptors.addAll([
          LogInterceptor(
            request: true,
            responseBody: true,
            requestBody: true,
            error: true,
          ),
        ]),
    );

    sl.registerLazySingleton<HttpClient>(() => DioHttpClient(dio: sl.get()));
  }
}
