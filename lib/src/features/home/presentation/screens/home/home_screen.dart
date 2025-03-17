import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/presentation/blocs/blocs.dart';
import 'package:colibreria/src/features/home/presentation/screens/home/views/new_books_result_view.dart';
import 'package:colibreria/src/features/home/presentation/screens/home/widgets/widgets.dart';
import 'package:colibreria/src/features/home/presentation/screens/searh/widgets/widgets.dart';
import 'package:colibreria/src/features/shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewBooksBloc>(
          create: (context) => NewBooksBloc(booksUseCases: DI.sl.get()),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppLocalizations.of(context).newBooks,
          showLeading: false,
          actions: [
            IconButton(
              icon: ImageManager.icons.search.toSvg(color: colors.onSurface),
              onPressed: () => _openSearch(context),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              const GapY.medium(),
              CategorySelector(),
              const GapY.medium(),
              const Expanded(child: NewBooksResultView()),
            ],
          ),
        ),
      ),
    );
  }

  void _openSearch(BuildContext context) {
    showSearch(
      context: context,
      delegate: BookSearchDelegate(searchBloc: context.read<SearchBooksBloc>()),
    );
  }
}
