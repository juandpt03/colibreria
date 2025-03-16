import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/data/data.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';

class HomeDepedency {
  HomeDepedency._();

  static void init() {
    DI.sl.registerLazySingleton<BooksRepository>(
      () => BooksRepositoryImpl(remoteDatasource: DI.sl.get()),
    );
    DI.sl.registerLazySingleton<BooksDatasource>(
      () => ItbookDatasource(client: DI.sl.get()),
    );

    DI.sl.registerLazySingleton<BooksUseCases>(
      () => BooksUseCases(repository: DI.sl.get()),
    );
  }
}
