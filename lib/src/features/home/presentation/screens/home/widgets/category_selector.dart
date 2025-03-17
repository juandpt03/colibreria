import 'package:colibreria/src/core/core.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    final List<String> categories = [
      AppLocalizations.of(context).all,
      AppLocalizations.of(context).travel,
      AppLocalizations.of(context).biography,
      AppLocalizations.of(context).horror,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Gaps.medium),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              categories.map((category) {
                final isSelected = category == AppLocalizations.of(context).all;
                return Padding(
                  padding: const EdgeInsets.only(right: Gaps.small),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Gaps.medium,
                      vertical: Gaps.small,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? colors.primary : colors.surface,
                      borderRadius: BorderRadius.circular(Gaps.radiusMedium),
                    ),
                    child: Text(
                      category,
                      style: textStyle.bodyMedium?.copyWith(
                        color:
                            isSelected
                                ? colors.onPrimary
                                : colors.onSurface.withValues(alpha: 0.6),
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
