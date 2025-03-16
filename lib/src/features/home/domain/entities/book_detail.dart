import 'package:equatable/equatable.dart';

class BookDetail extends Equatable {
  final String title;
  final String? subtitle;
  final String authors;
  final String publisher;
  final String isbn10;
  final String isbn13;
  final String pages;
  final String year;
  final String rating;
  final String desc;
  final String price;
  final String image;
  final String url;
  final List<Pdf>? pdfs;

  const BookDetail({
    required this.title,
    this.subtitle,
    required this.authors,
    required this.publisher,
    required this.isbn10,
    required this.isbn13,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required this.price,
    required this.image,
    required this.url,
    this.pdfs,
  });

  @override
  List<Object?> get props => [
    title,
    subtitle,
    authors,
    publisher,
    isbn10,
    isbn13,
    pages,
    year,
    rating,
    desc,
    price,
    image,
    url,
    pdfs,
  ];
}

class Pdf extends Equatable {
  final String name;
  final String url;

  const Pdf({required this.name, required this.url});

  @override
  List<Object?> get props => [name, url];
}
