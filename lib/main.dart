import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/shared/shared.dart';

import 'src/features/home/presentation/blocs/search_books/search_books_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.setup();
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(create: (context) => LanguageBloc()),

        BlocProvider<SearchBooksBloc>(
          create:
              (context) => SearchBooksBloc(
                booksUseCases: DI.sl.get(),
                debouncer: DI.sl.get(),
              ),
        ),
      ],
      child: MultiObserver(
        observers: [(context, child) => LanguageObserver(child: child)],
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LanguageBloc>().state;
    return MaterialApp.router(
      routerConfig: DI.sl<AppRouter>().router,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: locale,
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      themeMode: ThemeMode.dark,
      theme: DI.sl<AppTheme>().lightTheme,
      darkTheme: DI.sl<AppTheme>().darkTheme,
    );
  }
}
