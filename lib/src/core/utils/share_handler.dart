import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareHandler {
  static Future<void> shareBook({
    required BuildContext context,
    required BookDetail? book,
  }) async {
    try {
      if (book == null) {
        throw AppException.fromMessage(
          AppLocalizations.of(context).errorTryingToShareTheBook,
        );
      }
      final String textToShare =
          '${book.title} by ${book.authors}\n${book.subtitle}\n${AppLocalizations.of(context).price}: ${book.price}\n${AppLocalizations.of(context).checkItOut}: ${book.url}';

      await Share.share(
        textToShare,
        subject:
            '${AppLocalizations.of(context).checkOutThisBook} ${book.title}',
      );
    } catch (e) {
      if (context.mounted) {
        ActionHandler.onException(
          context: context,
          exception: AppException.fromMessage(
            '${AppLocalizations.of(context).errorTryingToShareTheBook} ${e.toString()}',
          ),
        );
      }
    }
  }
}
