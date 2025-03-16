import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/shared/presentation/widgets/widgets.dart';

class AlertService {
  static void showSnackbar({
    required BuildContext context,
    required String message,
    bool success = true,
  }) {
    if (!success) HapticFeedback.vibrate();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomSnackbar(message: message, success: success),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static void showToast({
    required BuildContext context,
    String? title,
    required String? description,
    bool success = true,
  }) {
    final overlay = Overlay.of(context, rootOverlay: true);
    late OverlayEntry entry;

    final top = MediaQuery.of(context).viewPadding.top + Gaps.medium;

    entry = OverlayEntry(
      builder:
          (context) => Positioned(
            top: top,
            left: Gaps.medium,
            right: Gaps.medium,
            child: Material(
              color: Colors.transparent,
              child: CustomToast(
                title: title,
                description: description ?? '',
                success: success,
                onClose: () {
                  entry.remove();
                },
              ),
            ),
          ),
    );

    overlay.insert(entry);

    Future.delayed(const Duration(seconds: 2), () {
      if (entry.mounted) {
        entry.remove();
      }
    });
  }
}
