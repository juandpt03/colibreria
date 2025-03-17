import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/data/data.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';

class HomeDependency {
  HomeDependency._();

  static void init() {
    final sl = DI.sl;

    // Datasources
    sl.registerLazySingleton<BooksDatasource>(
      () => ItbookDatasource(client: sl.get()),
    );

    // Repositories
    sl.registerLazySingleton<BooksRepository>(
      () => BooksRepositoryImpl(remoteDatasource: sl.get()),
    );

    // Use cases
    sl.registerLazySingleton<BooksUseCases>(
      () => BooksUseCases(repository: sl.get()),
    );
  }
}
