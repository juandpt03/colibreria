import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/presentation/blocs/search_books/search_books_bloc.dart';
import 'package:colibreria/src/features/home/presentation/screens/home/widgets/recent_search_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchHistoryView extends StatelessWidget {
  final List<String> searchHistory;
  final void Function(String)? onSearchSelected;

  const SearchHistoryView({
    super.key,
    required this.searchHistory,
    this.onSearchSelected,
  });

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchBooksBloc>();
    return Padding(
      padding: const EdgeInsets.all(Gaps.paddingLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: AppLocalizations.of(context).recentSearch),
          RecentSearchList(
            recentSearches: searchHistory,
            onClear: searchBloc.clearSearch,
            onSearchSelected: onSearchSelected,
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: Gaps.paddingMedium),
      child: Text(
        title,
        style: textStyle.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
