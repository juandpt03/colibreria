import 'package:colibreria/src/core/config/intl/l10n.dart';
import 'package:flutter/material.dart';

class EmptyResultsView extends StatelessWidget {
  final String query;

  const EmptyResultsView({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Center(
      child: Text(
        '${AppLocalizations.of(context).noBooksFoundFor} "$query"',
        style: textStyle.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
