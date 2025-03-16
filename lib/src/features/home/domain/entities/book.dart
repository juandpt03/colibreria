import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  const Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  @override
  List<Object?> get props => [title, subtitle, isbn13, price, image, url];
}
