import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:colibreria/src/core/error/app_exeption.dart';
import 'package:colibreria/src/features/shared/presentation/widgets/widgets.dart';

class ActionHandler {
  static Future<void> closeAction({
    required BuildContext context,
    required Future<AppException?> Function() action,
  }) => action().then((response) {
    if (!context.mounted) return;
    if (response != null) {
      AlertService.showToast(
        context: context,
        description: response.message,
        success: false,
      );
    }
    context.pop();
  });

  static Future<void> alertAction({
    required BuildContext context,
    required Future<AppException?> Function() action,
  }) => action().then((response) {
    if (!context.mounted) return;
    if (response != null) {
      AlertService.showToast(
        context: context,
        description: response.message,
        success: false,
      );
    }
  });
  static void onException({
    required BuildContext context,
    required AppException? exception,
  }) {
    if (exception != null) {
      return AlertService.showToast(
        context: context,
        description: exception.message,
        success: false,
      );
    }
  }
}
