import 'package:colibreria/src/core/core.dart';
import 'package:flutter/material.dart';

class RecentSearchItem extends StatelessWidget {
  final String search;
  final VoidCallback onClear;
  final void Function(String)? onSearchSelected;

  const RecentSearchItem({
    super.key,
    required this.search,
    required this.onClear,
    required this.onSearchSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return InkWell(
      onTap: () => onSearchSelected?.call(search),
      borderRadius: BorderRadius.circular(Gaps.radiusSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Gaps.paddingSmall),
              child: Text(
                search,
                style: textStyle.bodyLarge?.copyWith(
                  color: colors.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            iconSize: Gaps.iconSmall,
            onPressed: onClear,
          ),
        ],
      ),
    );
  }
}
