import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:colibreria/src/core/core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final bool showLeading;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    this.title = '',
    this.actions = const [],
    this.showLeading = true,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return AppBar(
      elevation: 0,
      title: Text(
        title,
        style: textStyle.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading:
          showLeading
              ? leading ??
                  Padding(
                    padding: const EdgeInsets.all(Gaps.paddingSmall),
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: Icon(Icons.arrow_back),
                    ),
                  )
              : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
