import 'package:colibreria/src/features/home/presentation/blocs/search_books/search_books_bloc.dart';
import 'package:colibreria/src/features/home/presentation/screens/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:colibreria/src/features/shared/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home Screen',
        showLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _openSearch(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Home Screen!'),
            const GapY.large(),
            ElevatedButton(
              onPressed: () => _openSearch(context),
              child: const Text('Search for Books'),
            ),
          ],
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
