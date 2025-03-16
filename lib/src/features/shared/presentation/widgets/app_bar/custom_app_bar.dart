import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:colibreria/src/core/core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final bool showLeading;

  const CustomAppBar({
    super.key,
    this.title = '',
    this.actions = const [],
    this.showLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return AppBar(
      elevation: 0,
      title: Text(
        title,
        style: textStyle.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading:
          showLeading
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colors.surface,
                      shape: BoxShape.circle,
                      border: Border.all(color: colors.primary.withAlpha(51)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ImageManager.icons.backArrow.toSvg(
                        color: colors.onSurface,
                      ),
                    ),
                  ),
                ),
              )
              : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
