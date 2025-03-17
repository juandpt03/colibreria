import 'package:colibreria/src/core/config/intl/l10n.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:colibreria/src/core/error/app_exeption.dart';
import 'package:colibreria/src/features/shared/presentation/widgets/alerts/action_handler.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UrlLauncherHandler {
  static Future<void> launchUrl({
    required BuildContext context,
    required String url,
    LaunchMode mode = LaunchMode.platformDefault,
  }) async {
    try {
      final Uri uri = Uri.parse(url);
      final bool launched = await url_launcher.launchUrl(uri, mode: mode);

      if (!launched) {
        if (context.mounted) {
          ActionHandler.onException(
            context: context,
            exception: AppException.fromMessage(
              '${AppLocalizations.of(context).couldNotOpenTheUrl} $url',
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ActionHandler.onException(
          context: context,
          exception: AppException.fromMessage(
            '${AppLocalizations.of(context).errorOpeningTheUrl} ${e.toString()}',
          ),
        );
      }
    }
  }

  static Future<bool> canLaunchUrlSafely(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      return await url_launcher.canLaunchUrl(uri);
    } catch (_) {
      return false;
    }
  }
}
