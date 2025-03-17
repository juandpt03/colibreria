import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/features/home/presentation/blocs/search_books/search_books_bloc.dart';
import 'package:colibreria/src/features/home/presentation/screens/searh/widgets/widgets.dart';
import 'package:colibreria/src/features/shared/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'New Books',
        showLeading: false,
        actions: [
          IconButton(
            icon: ImageManager.icons.search.toSvg(),
            onPressed: () => _openSearch(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const GapY.medium(),
            _CategorySelector(),
            const GapY.medium(),
            const Expanded(child: _BookGrid()),
          ],
        ),
      ),
    );
  }

  void _openSearch(BuildContext context) {
    showSearch(
      context: context,
      delegate: BookSearchDelegate(searchBloc: context.read<SearchBooksBloc>()),
    );
  }
}

class _CategorySelector extends StatelessWidget {
  final List<String> categories = ['All', 'Travel', 'Biography', 'Horror'];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Gaps.medium),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              categories.map((category) {
                final isSelected = category == 'All';
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

class _BookGrid extends StatelessWidget {
  const _BookGrid();

  @override
  Widget build(BuildContext context) {
    // Sample book data for demonstration
    final List<Book> books = [
      const Book(
        title: 'Shadow of Success',
        subtitle: 'Style Meets Imagination',
        isbn13: '9781234567890',
        price: '\$19.99',
        image: 'https://example.com/shadow.jpg',
        url: 'https://example.com/shadow',
      ),
      const Book(
        title: 'Latest Fashion Trends',
        subtitle: 'Style Meets Imagination',
        isbn13: '9781234567891',
        price: '\$24.99',
        image: 'https://example.com/fashion.jpg',
        url: 'https://example.com/fashion',
      ),
      const Book(
        title: 'Travel Guides',
        subtitle: 'Explore the world',
        isbn13: '9781234567892',
        price: '\$29.99',
        image: 'https://example.com/travel.jpg',
        url: 'https://example.com/travel',
      ),
      const Book(
        title: 'Jungle of Jokes',
        subtitle: 'Laugh out loud',
        isbn13: '9781234567893',
        price: '\$14.99',
        image: 'https://example.com/jokes.jpg',
        url: 'https://example.com/jokes',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(Gaps.medium),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: Gaps.medium,
          mainAxisSpacing: Gaps.medium,
          childAspectRatio: 0.6,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final List<Color> coverColors = [
            Colors.deepPurple,
            Colors.teal,
            Colors.deepOrange,
            Colors.deepPurple.shade900,
          ];
          return _BookItem(
            book: books[index],
            color: coverColors[index % coverColors.length],
          );
        },
      ),
    );
  }
}

class _BookItem extends StatelessWidget {
  final Book book;
  final Color color;

  const _BookItem({required this.book, required this.color});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(Gaps.radiusMedium),
            ),
            child: CachedNetworkImage(
              imageUrl: book.image,
              fit: BoxFit.cover,
              imageBuilder:
                  (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Gaps.radiusMedium),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            book.title.split(' ').first,
                            style: textStyle.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const GapY.small(),
                          Text(
                            book.title.split(' ').sublist(1).join(' '),
                            style: textStyle.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              placeholder: (context, url) => const CustomLoading(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        const GapY.small(),
        Text(
          book.subtitle,
          style: textStyle.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          'by ${book.isbn13}', // Using isbn13 as author for demo
          style: textStyle.bodySmall?.copyWith(
            color: colors.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
