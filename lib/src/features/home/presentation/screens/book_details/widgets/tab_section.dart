import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/features/home/presentation/screens/book_details/widgets/widgets.dart';

import 'package:flutter/material.dart';

class TabSection extends StatefulWidget {
  final BookDetail book;

  const TabSection({super.key, required this.book});

  @override
  State<TabSection> createState() => TabSectionState();
}

class TabSectionState extends State<TabSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final Size size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: colors.primary,
          unselectedLabelColor: colors.onSurfaceVariant,
          indicatorColor: colors.primary,
          tabs: [
            Tab(text: AppLocalizations.of(context).aboutBook),
            Tab(text: AppLocalizations.of(context).chapters),
            Tab(text: AppLocalizations.of(context).reviews),
          ],
        ),
        SizedBox(
          height: size.height * 0.36,
          child: TabBarView(
            controller: _tabController,
            children: [
              AboutBookTab(book: widget.book),
              ChaptersTab(book: widget.book),
              ReviewsTab(book: widget.book),
            ],
          ),
        ),
      ],
    );
  }
}
