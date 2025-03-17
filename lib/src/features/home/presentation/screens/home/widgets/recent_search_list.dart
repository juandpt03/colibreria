import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/presentation/screens/home/widgets/recent_search_items.dart';
import 'package:flutter/material.dart';

class RecentSearchList extends StatelessWidget {
  final List<String> recentSearches;
  final Function(int) onClear;
  final Function(String)? onSearchSelected;

  const RecentSearchList({
    super.key,
    required this.recentSearches,
    required this.onClear,
    required this.onSearchSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    if (recentSearches.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: Gaps.medium),
        child: Text(
          AppLocalizations.of(context).noRecentSearches,
          style: textStyle.bodyMedium,
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recentSearches.length,
      itemBuilder: (context, index) {
        final search = recentSearches[index];
        return RecentSearchItem(
          search: search,
          onClear: () => onClear(index),
          onSearchSelected: onSearchSelected,
        );
      },
    );
  }
}
